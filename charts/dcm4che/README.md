# Instalador DCM4Che

Helm para instalar DCM4Che en Rancher

No incluye gatekeeper que se debe instalar en una segunda etapa

Para Fluent Bit se debe tener instalado el repositorio estable

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```

## Proceso de instalación

- Instalar dcm4che sin gatekeeper (usar el certificado del Load Balancer)
- Habilitar en keycloak pacs, visor, kibana, console-pacs
- Hacer upgrade de dcm4che habilitando gatekeeper e incluyendo el secret otorgado en keycloak para gatekeeper

## Proceso de actualización de certificados

- Actualizar secrets dcm4che/ingress-cert
- Hacer hash del nuevo cert
- Actualizar variable de entorno del deployment de pacs