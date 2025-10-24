const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'igra',
    waitForConnections: true,  // Čaka, če ni prostih povezav
    connectionLimit: 10,       // Največje število povezav
    queueLimit: 0              // Največje število čakajočih zahtev
});

module.exports = pool;