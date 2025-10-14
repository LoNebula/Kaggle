# kaggle

# Build and Run the Container
Run the following command to build the image from the Dockerfile and start the container in the background according to the settings in docker-compose.yml.
```bash
docker compose up --build -d
```

# Enter the Container
To get a shell inside the running container, execute the following command.
```bash
docker compose exec app /bin/bash
```

# Verify GPU Access
After entering the container, start Python and run the following code to check if PyTorch is correctly recognizing the GPU.
```python
import torch
print(torch.cuda.is_available())
```
