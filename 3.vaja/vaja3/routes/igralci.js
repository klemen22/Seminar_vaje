const express = require('express');
const router = express.Router();
const pool = require('../utils/db.js'); // uvozimo Connection Pool
const utils = require('../utils/utils.js'); // uvozimo pomožne funckije
const bcrypt = require('bcrypt'); // knjižnica za zgoščevanje gesel (hash)

/* Pridobivanje vseh igralcev */
router.get('/', async (req, res, next) => {
    try {
        // Uporabimo pool.execute() za varno izvedbo poizvedbe
        const [rows, fields] = await pool.execute('SELECT vzdevek, ime, priimek, email FROM igralec');
        
        res.status(200).json(rows);		// Pošljemo podatke uporabniku kot JSON

    } catch (err) {
        next(err);
	}
});

/* Pridobivanje igralca s posredovanim vzdevkom */
router.get('/:vzdevek', async (req, res, next) => {
    try {
		const vzdevek = req.params.vzdevek;
        const [rows, fields] = await pool.execute('SELECT vzdevek, ime, priimek, email FROM igralec WHERE vzdevek=?', [vzdevek]);
        
		if (rows.length === 0) {
            // Če je dolžina niza 0, igralec ne obstaja
            return res.status(404).json({
                message: `Igralec z vzdevkom '${vzdevek}' ne obstaja.`
            });
        }
        
        // Pošljemo podatke uporabniku kot JSON
        res.status(200).json(rows[0]);

    } catch (err) {
        next(err);
    }
});

module.exports = router;
