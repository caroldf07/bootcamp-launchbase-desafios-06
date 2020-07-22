const { Pool } = require ('pg')

module.exports = new Pool({
    user: 'postgres',
    password:'postgres',
    host: 'localhost',
    port: 5342,
    database: 'LaunchStore'
})