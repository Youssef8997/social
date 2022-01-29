
abstract class whatsappshopappstate{}
class  whatsappshopappstateinis  extends whatsappshopappstate{}
class  whatsappshopappstateloding  extends whatsappshopappstate{}
class  whatsappshopappstatesucsses  extends whatsappshopappstate{

}
class  whatsappshopappstateerror extends whatsappshopappstate{

}
class changeobserved extends whatsappshopappstate{

}
class  whatsappregstershopappstateloding extends whatsappshopappstate{}
class  whatsappregstershopappstatesucsses extends whatsappshopappstate{}
class  whatsappsregsterhopappstateerror extends whatsappshopappstate{}
class  whatsapploginshopappstateloding extends whatsappshopappstate{}
class  whatsapploginshopappstatesucsses extends whatsappshopappstate{}
class  whatsappsloginhopappstateerro extends whatsappshopappstate{
  final error;
  whatsappsloginhopappstateerro(this.error);
}
class  whatsappusercarshopappstateloding extends whatsappshopappstate{}
class  whatsappusercarshopappstatesucsses extends whatsappshopappstate{}
class  whatsappsusercarhopappstateerror extends whatsappshopappstate{
  final error;
  whatsappsusercarhopappstateerror(this.error);
}