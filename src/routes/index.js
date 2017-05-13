import Router from 'koa-router'
// import db from '../db'

const router = new Router()
// const Demo = db.get('demo')

router.get('/', async ctx => {
  // const data = await Demo.find({})

  // ctx.body = data

  ctx.body = [
    {foo: 'bar'}
  ]
})

router.post('/', async ctx => {
  // const input = ctx.request.body

  // const inserted = await Demo.insert(input)

  // if (inserted === null) {
  //   ctx.status = 405
  //   throw new Error('Error while creating object')
  // }

  // ctx.body = inserted
  ctx.body = ctx.request.body
})

router.get('/health', async ctx => {
  ctx.body = { timestamp: Date.now() }
})

export default router
