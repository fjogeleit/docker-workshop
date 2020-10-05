const fastify = require('fastify')()
const isOdd = require('is-odd')

const port = process.env.PORT || 3000

fastify.get('/is-odd/:number', (request, reply) => {
    return reply.send({ 'is-odd': isOdd(request.params.number) })
})

fastify.listen(port, `0.0.0.0`, (err) => {
    if (err) throw err
    console.log(`server listening on ${fastify.server.address().port}`)
})