const express = require("express");
const router = express.Router();
const pool = require("../utils/db.js"); // uvozimo Connection Pool
const utils = require("../utils/utils.js"); // uvozimo pomožne funckije
const bcrypt = require("bcrypt"); // knjižnica za zgoščevanje gesel (hash)

/* Pridobivanje vseh igralcev */
router.get("/", async (req, res, next) => {
  try {
    // Uporabimo pool.execute() za varno izvedbo poizvedbe
    const [rows, fields] = await pool.execute(
      "SELECT vzdevek, ime, priimek, email FROM igralec"
    );

    res.status(200).json(rows); // Pošljemo podatke uporabniku kot JSON
  } catch (err) {
    next(err);
  }
});

/* Pridobivanje igralca s posredovanim vzdevkom */
router.get("/:vzdevek", async (req, res, next) => {
  try {
    const vzdevek = req.params.vzdevek;
    const [rows, fields] = await pool.execute(
      "SELECT vzdevek, ime, priimek, email FROM igralec WHERE vzdevek=?",
      [vzdevek]
    );

    if (rows.length === 0) {
      // Če je dolžina niza 0, igralec ne obstaja
      return res.status(404).json({
        message: `Igralec z vzdevkom '${vzdevek}' ne obstaja.`,
      });
    }

    // Pošljemo podatke uporabniku kot JSON
    res.status(200).json(rows[0]);
  } catch (err) {
    next(err);
  }
});

router.post("/", async (req, res, next) => {
  const { vzdevek, geslo, ime, priimek, email } = req.body;

  if (!vzdevek || !geslo || !ime || !priimek || !email) {
    return res.status(400).json({ message: "Manjkajo podatki za registracij" });
  }

  try {
    if (await utils.igralecObstaja(vzdevek)) {
      return res
        .status(400)
        .json({ message: "Igralec z istim imenom ze obstaja" });
    }
    const hash_geslo = await bcrypt.hash(geslo, 10);

    const sql =
      "INSERT INTO igralec (vzdevek, geslo, ime, priimek, email) VALUES (?, ?, ?, ?, ?)";
    const [results] = await pool.execute(sql, [
      vzdevek,
      hash_geslo,
      ime,
      priimek,
      email,
    ]);

    if (results.affectedRows === 1) {
      const urlVira = utils.urlVira(req, `/igralci/${vzdevek}`);
      res.location(urlVira);
      res.status(201).json({ message: "igralec uspesno dodan", url: urlVira });
    } else {
      res.status(500).json({ message: "dodajanje igralca ni bilo uspesno" });
    }
  } catch (err) {
    next(err);
  }
});

router.put("/:vzdevek", async (req, res, next) => {
  const vzdevek = req.params.vzdevek;
  const { geslo, ime, priimek, email } = req.body; // pridobimo podatke iz telesa zahteve

  try {
    if (!(await utils.igralecObstaja(vzdevek))) {
      res.status(404).json({ message: "Igralec ne obstaja" });
    }

    // Preverimo, če so prisotni vsi potrebni parametri
    if (!geslo || !ime || !priimek || !email) {
      return res.status(400).json({
        message:
          "Manjkajo podatki za posodabljanje uporabnika ali pa niso pravilno strukturirani!",
      });
    }

    const hash_geslo = await bcrypt.hash(geslo, 10);
    const sql =
      "UPDATE igralec SET geslo=?, ime=?, priimek=?, email=? WHERE vzdevek=?";
    const [result] = await pool.execute(sql, [
      hash_geslo,
      ime,
      priimek,
      email,
      vzdevek,
    ]);

    if (result.affectedRows === 1) {
      res.status(204).send();
    } else {
      res.status(500).json({ message: "Dodajanje igralca ni bilo uspešno!" });
    }
  } catch (err) {
    next(err);
  }
});

module.exports = router;
