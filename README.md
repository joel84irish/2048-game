
# 2048 Game

I built this DevOps project around the classic 2048 game, originally created by Gabriele Cirulli. Using his open-source repository, I created a Docker image and containerized the game for deployment.

To fully automate the deployment, I leveraged GitHub Actions for CI/CD and used Terraform to provision infrastructure on AWS ECS (Elastic Container Service). This streamlined approach ensures that the game is efficiently deployed and managed in the cloud.
For those unfamiliar, 2048 is a sliding block puzzle that involves simple math. The objective is to merge tiles of the same number to eventually reach 2048.Step-by-step guide.


You can access my application by entering the domain name I configured in AWS Route 53 into your web browser:

```
joelirish-game-project.app
```


![image](https://github.com/user-attachments/assets/04a19f0f-1c0f-445d-861e-a5ea95352940)

