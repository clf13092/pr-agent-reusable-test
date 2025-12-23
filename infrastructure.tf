# テスト用のTerraformファイル - 意図的にコーディング規約違反を含む

resource "aws_instance" "BadInstanceName"{
  ami           = "ami-12345678"
  instance_type="t3.micro"
  
  # ハードコーディングされたキーペア（セキュリティ問題）
  key_name="my-hardcoded-key"
  
  tags={
    Name="test-instance"
    Environment="production"
    # 機密情報をタグに含める（セキュリティ違反）
    DatabasePassword="secret123"
  }
}

# 過度に開放されたセキュリティグループ
resource "aws_security_group" "bad_sg" {
  name_description = "Overly permissive security group"
  
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 全世界からのアクセス許可（危険）
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "database_password"{
  description="Database password"
  type=string
  # デフォルト値にハードコーディング（セキュリティ違反）
  default="admin123"
}

# IAM権限が過度に広い
resource "aws_iam_policy" "overly_broad_policy" {
  name        = "OverlyBroadPolicy"
  description = "Policy with too many permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"  # 全ての権限を許可（危険）
        Resource = "*"
      }
    ]
  })
}