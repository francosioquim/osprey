HttpUtils = require '../utils/http-utils'
ApiKitBase = require '../utils/base'

class MockPutHandler extends HttpUtils
  resolve: (req, res, methodInfo) ->
    @negotiateContentType req, res, methodInfo
    @negotiateAcceptType req, res, methodInfo

class PutHandler extends ApiKitBase
  constructor: (@apiPath, @context, @resources) ->

  resolve: (uriTemplate, handler) =>
    template = "#{@apiPath}#{uriTemplate}"

    @context.put template, (req, res) =>
      methodInfo = @methodLookup @resources, 'put', uriTemplate
      @negotiateContentType req, res, methodInfo
      @negotiateAcceptType req, res, methodInfo, handler

exports.MockHandler = MockPutHandler
exports.Handler = PutHandler