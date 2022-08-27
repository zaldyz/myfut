import pkg from 'pg';
const { Pool } = pkg;

const pool = new Pool({
  database: 'myfut'
})

module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback)
  },
}
