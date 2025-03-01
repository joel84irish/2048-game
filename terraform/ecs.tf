resource "aws_ecs_cluster" "2048" {
  name = "2048-sandbox"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  # service_connect_defaults {
  #   namespace = "arn:aws:servicediscovery:eu-west-2:489877524855:namespace/ns-snrxsntyatl2fui3"
  # }
}


resource "aws_ecs_task_definition" "2048_task" {
  family                   = "2048"
  cpu                      = "1024"
  memory                   = "3072"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([
    {
      name      = "2048"
      image     = "980921749029.dkr.ecr.us-west-2.amazonaws.com/2048:latest"
      cpu       = 0
      essential = true
      portMappings = [{
        containerPort = 80
        hostPort      = 80
        protocol      = "tcp"
        name          = "tmc-80-tcp"
        appProtocol   = "http"
      }]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/2048"
          awslogs-region        = "us-west-2"
          awslogs-stream-prefix = "ecs"
          mode                  = "non-blocking"
          awslogs-create-group  = "true"
          max-buffer-size       = "25m"
        }
        secretOptions = []
      }
      environment      = []
      environmentFiles = []
      mountPoints      = []
      volumesFrom      = []
      systemControls   = []
      ulimits          = []
    }
  ])

  runtime_platform {
    cpu_architecture        = "ARM64"
    operating_system_family = "LINUX"
  }
}



resource "aws_ecs_service" "2048_service" {
  name            = "2048-service"
  cluster         = aws_ecs_cluster.2048.id
  task_definition = aws_ecs_task_definition.2048_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  enable_ecs_managed_tags           = true
  propagate_tags                    = "NONE"
  health_check_grace_period_seconds = 0

  network_configuration {
    subnets          = aws_subnet.public[*].id
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = true
  }

  # capacity_provider_strategy {
  #   capacity_provider = "FARGATE"
  #   base              = 0
  #   weight            = 1
  # }

  # alarms {
  #   enable      = true
  #   rollback    = true
  #   alarm_names = []
  # }

  load_balancer {
    target_group_arn = aws_lb_target_group.tm_target_group.arn
    container_name   = "2048"
    container_port   = 80
  }

  deployment_controller {
    type = "ECS"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  depends_on = [aws_lb_listener.http]
}



