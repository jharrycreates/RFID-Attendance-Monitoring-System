require("dotenv").config();

const { Pool } = require("pg");

const isProduction = process.env.NODE_ENV === "production";

const connectionString = `postgresql://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_DATABASE}`;


const pool = new Pool({
  user: 'postgres',          // Your PostgreSQL username
  host: 'localhost',         // Database host
  database: 'my_database',   // The database you just created
  password: '2002', // Your PostgreSQL password
  port: 5432,                // Default PostgreSQL port
});
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Error connecting to the database', err);
  } else {
    console.log('Connected to the database', res.rows);
  }
});
module.exports = pool;

