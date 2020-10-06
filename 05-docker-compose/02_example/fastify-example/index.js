const fastify = require('fastify')()
const isOdd = require('is-odd')

const port = process.env.PORT || 3000

fastify.register(require('fastify-postgres'), {
    connectionString: `postgres://${process.env.POSTGRES_USER}:${process.env.POSTGRES_PASSWORD}@${process.env.POSTGRES_HOST}:5432/${process.env.POSTGRES_DB}`
})

fastify.get('/tables', async () => {
    const client = await fastify.pg.connect()
    const { rows } = await client.query('SELECT * FROM pg_tables')

    client.release()
    
    return rows
})

fastify.listen(port, `0.0.0.0`, (err) => {
    if (err) throw err
    console.log(`server listening on ${fastify.server.address().port}`)
})