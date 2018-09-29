'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    this.ctx.body = '1111111111';
  }
}

module.exports = HomeController;
