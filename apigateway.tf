resource "aws_apigatewayv2_vpc_link" "fiap_producao" {
  name               = "${var.app_name}-vpc-link"
  subnet_ids         = [data.aws_subnet.clustera.id, data.aws_subnet.clusterb.id, data.aws_subnet.clusterc.id]
  security_group_ids = []
  tags = {
    Name = "api-${var.app_name}"
  }
}

resource "aws_apigatewayv2_api" "fiap_producao" {
  name          = "${var.app_name}-api"
  description   = "API Gateway for fiap-producao"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_route" "fiap_producao" {
  api_id     = aws_apigatewayv2_api.fiap_producao.id
  route_key  = "ANY /{proxy+}"
  target     = "integrations/${aws_apigatewayv2_integration.fiap_producao.id}"
  depends_on = [aws_apigatewayv2_integration.fiap_producao]
}

resource "aws_apigatewayv2_integration" "fiap_producao" {
  api_id           = aws_apigatewayv2_api.fiap_producao.id
  integration_type = "HTTP_PROXY"
  integration_uri  = aws_lb_listener.fiap_producao.arn

  integration_method     = "ANY"
  connection_type        = "VPC_LINK"
  connection_id          = aws_apigatewayv2_vpc_link.fiap_producao.id
  payload_format_version = "1.0"
  depends_on = [aws_apigatewayv2_vpc_link.fiap_producao,
    aws_apigatewayv2_api.fiap_producao,
  aws_lb_listener.fiap_producao]
}

resource "aws_apigatewayv2_stage" "fiap_producao" {
  api_id      = aws_apigatewayv2_api.fiap_producao.id
  name        = "$default"
  auto_deploy = true
  depends_on  = [aws_apigatewayv2_api.fiap_producao]
}

output "apigw_endpoint" {
  value       = aws_apigatewayv2_api.fiap_producao.api_endpoint
  description = "API Gateway Endpoint"
}
