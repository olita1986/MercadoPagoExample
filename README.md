# Payment Project 

## Este proyecto utiiza las apis de `Mercado Pago` para crear un flow de pagos de cuotas

**Caracteristicas:**

 * Arquitecture utilizada: Clean Swift (VIP cycle)
 * POP para abstraer clases y servicios
 * Se creo ambientes de desarrollo y release (Stubs)
 * Se utilizo factory patter para generar modelos de negocio en los tests
 * Se agrego ejemplo de Unit Tests para la escena de `PaymentSelection`
 * Inyeccion de dependencia a traves del router y datastore store de cada escena
 * Codable protocol para parsear objetos
 * Cocoapods como organizador de dependencias
 * GIT para version control