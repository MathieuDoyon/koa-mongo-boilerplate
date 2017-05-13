import supertest from 'supertest'
import app from '../src/app'
// import db from '../src/db'

const server = app.listen()
const request = supertest.agent(server)

describe('Index routes', () => {
  afterAll(() => {
    server.close()
    // db.close()
  })

  it('Homepage', async () => {
    const res = await request.get('/')

    expect(res.status).toEqual(200)
    expect(res.body).toEqual(expect.any(Array))
  })

  it('Post', async () => {
    const res = await request.post('/')
      .send({
        name: 'Foo Bar'
      })

    expect(res.status).toEqual(200)
    expect(res.body).toHaveProperty('name')
    expect(res.body.name).toBe('Foo Bar')
  })

  it('Health', async () => {
    const res = await request.get('/health')

    expect(res.status).toEqual(200)
    expect(res.body).toHaveProperty('timestamp')
  })

  it('Method Not Allowed', async () => {
    const res = await request.post('/health')

    expect(res.status).toEqual(405)
  })

  it('Should get an not found page', async () => {
    const res = await request.get('/no-found')

    expect(res.status).toEqual(404)
  })
})
