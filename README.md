# DevOps Experts - CI/CD project
---
**3rd part**

**THIS BRANCH IS FOR THE MYSQL AS A CONTAINER INTEGRATION**

Python files reused and adapted from former projects.

## Aim

use Jenkins and Docker + Docker-Compose
to build, test and upload the rest_app to docker hub.

### General pipeline:
    1. pull code, run `rest_app.py`
    2. Test the server, clean enviornment afterwards.
    3. build a docker image, and push it to the hub.
    4. Using the build number in jenkins, set an image build number and
       `docker-compose up -d` it.
    5. After giving it a moment to build and stablize, run another test on the
       dockerized app
    6. afterwards, `docker-compose down` and remove the (local) image.

    * as a bonus, use a containerized MySQL db instead of the old online one.

`data` folder contains the `.sql` file to initialise the db in the instance of mysql
containers, for docker-compose.

by Whitehawk, 2021 D:

```python
print('all your base are belong to us')
```
