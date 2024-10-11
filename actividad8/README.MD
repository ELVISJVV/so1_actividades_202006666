# Actividad 8 - Primeros pasos con K8s

## Desplegar un contenedor de nginx usando minikube

1. Iniciar el clúster de Kubernetes local con Minikube

   ```bash
   minikube start
   ```
2. Crear el archivo de configuración del despliegue de Nginx
   
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21.0
        ports:
        - containerPort: 80

```
   3. Aplicar el Deployment en el clúster

```bash

    kubectl apply -f nginx-deployment.yaml

```

4. Exponer el servicio de Nginx:

```bash
    kubectl expose deployment nginx-deployment --type=NodePort --port=80
```

5. Verifica el servicio
    
```bash

    minikube service nginx-deployment

```



----

## ¿En un ambiente local de Kubernetes existen los nodos masters y workers, como es que esto funciona?

En un clúster local de Kubernetes usando Minikube, generalmente solo hay un nodo que cumple ambas funciones: master y worker. En un clúster estándar, estos roles están separados para proporcionar una mayor escalabilidad y eficiencia. 


En Minikube, dado que todo se ejecuta en un solo nodo, este nodo maneja tanto los componentes del master como los workers. Esto simplifica el entorno de desarrollo y pruebas, permitiendo a los usuarios aprender y experimentar con Kubernetes sin la complejidad de un clúster distribuido. Sin embargo, esta configuración puede limitar la escalabilidad y no refleja la arquitectura típica de un clúster en producción.

En resumen, mientras que Minikube combina ambos roles en un único nodo para facilitar el aprendizaje y el desarrollo, en un clúster de Kubernetes de producción, los nodos master y worker están separados para gestionar eficientemente los recursos y escalar las aplicaciones según sea necesario.
