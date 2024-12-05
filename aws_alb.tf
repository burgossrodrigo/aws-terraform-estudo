resource "aws_lb" "bia" {
    name              = "bia-alb"
    load_balancer_type = "application"
    subnets           = [var.subnet_id_a, var.subnet_id_b]
    security_groups   = [aws_security_group.bia_alb.id] # Referencia ao security group criado
}

resource "aws_lb_target_group" "tg-bia" {
    name_prefix     = "tgbia-"
    port     = 80
    protocol = "HTTP"
    vpc_id   = var.vpc_id
    deregistration_delay = 30
    target_type = "instance"

    health_check {
        enabled = true
        path = "/api/versao"
        matcher = 200
        interval = 10
        timeout = 5
        healthy_threshold = 2
        unhealthy_threshold = 3
    }
}

resource "aws_lb_listener" "bia" {
    load_balancer_arn = aws_lb.bia.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.tg-bia.arn
    }
}

output "alb_url" {
    value = aws_lb.bia.dns_name
}


