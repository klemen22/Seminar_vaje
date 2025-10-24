const express = require("express");
const pool = require("../db.js");
const router = express.Router();

/* GET home page. */
router.get("/", (req, res, next) => {
  res.render("index", { title: "Express" });
});

router.get("/igralci", async (req, res, next) => {
  try {
    const [rows, fields] = await pool.execute(
      "SELECT vzdevek, ime, priimek, email FROM igralec"
    );
    res.status(200).json(rows);
  } catch (error) {
    next(error);
  }
});

router.get("/igralci/:vzdevekI", async (req, res, next) => {
  const vzdevekIgralca = req.params.vzdevekI;

  try {
    const [rows, fields] = await pool.execute(
      "SELECT vzdevek, ime, priimek, email FROM igralec WHERE vzdevek=?",
      [vzdevekIgralca]
    );
    res.status(200).json(rows);
  } catch (error) {
    next(error);
  }
});

router.get("/lestvica/:inputTezavnost", async (req, res, next) => {
  const tezavnost = req.params.inputTezavnost;

  try {
    const [rows, fields] = await pool.execute(
      "SELECT vzdevek, MAX(rezultat) FROM odigrana_igra WHERE tezavnost=? GROUP BY vzdevek ORDER BY MAX(rezultat) DESC LIMIT 5",
      [tezavnost]
    );
    res.status(200).json(rows);
  } catch (error) {
    next(error);
  }
});

module.exports = router;
