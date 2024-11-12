# import {
#     id = "role-acesso-ssm"
#     to = aws_iam_role.role_acesso_ssm
# }

# import {
#     id = "role-acesso-ssm"
#     to = aws_iam_instance_profile.role_acesso_ssm
# } 

# import {
#     id = "bia"
#     to = aws_db_instance.bia
# }

# import {
#     id = "sg-09d39b47b99351e41"
#     to = aws_security_group.bia_db
# }

# import {
#     id = "sg-0926fa37745dddb49"
#     to = aws_security_group.bia_web
# }

# import {
#     id = "sg-0de65af3bfc79df7f"
#     to = aws_security_group.bia_alb
# }

# import {
#     id = "sg-03ac575d99beed41a"
#     to = aws_security_group.bia_ec2
# }
import {
    id = "sg-097535b2f600ac08a"
    to = aws_security_group.bia_dev
}


