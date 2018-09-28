'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    this.ctx.body = 'ddddddd';
  }
}

module.exports = HomeController;
