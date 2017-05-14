import Router from 'koa-router'
import db from '../db'
import { version } from '../../package.json'

const router = new Router()
const Demo = db.get('demo')

router.get('/', async ctx => {
  const data = await Demo.find({})

  ctx.body = data
})

router.post('/', async ctx => {
  const input = ctx.request.body

  const inserted = await Demo.insert(input)

  if (inserted === null) {
    ctx.status = 405
    throw new Error('Error while creating object')
  }

  ctx.body = inserted
})

router.get('/health', async ctx => {
  ctx.body = {
    timestamp: Date.now(),
    version
  }
})

export default router
