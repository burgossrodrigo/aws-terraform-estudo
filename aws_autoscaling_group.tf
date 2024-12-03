resource "aws_autoscaling_group" "ecs" {
    name_prefix = "cluster-ecs-bia-asg-"
    vpc_zone_identifier = [var.subnet_id_b, var.subnet_id_a]
    min_size = 0
    desired_capacity = 0
    max_size = 1
    health_check_grace_period = 0
    health_check_type = "EC2"
    protect_from_scale_in = false

    launch_template {
        id = aws_launch_template.ecs_ec2.id
        version = "$Latest"
    }

    lifecycle {
      ignore_changes = [ desired_capacity ]
    }

    tag {
        key = "Name"
        value = "cluster-ecs-bia-asg"
        propagate_at_launch = true
    }

    tag {
        key = "AmazonECSManaged"
        value = ""
        propagate_at_launch = true
    }
}