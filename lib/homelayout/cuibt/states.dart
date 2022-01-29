abstract class whatsappstates{}
class whatsappinit extends whatsappstates{}
class whatsappgetuserloding extends whatsappstates{}
class whatsappgetusersuccses extends whatsappstates{}
class whatsappgetusererror extends whatsappstates{
  final model;

  whatsappgetusererror(this.model);
}
class whatsappgetpostsloding extends whatsappstates{}
class whatsappgetpostssuccses extends whatsappstates{}
class whatsappgetpostserror extends whatsappstates{
  final model;

  whatsappgetpostserror(this.model);
}
class whatsappglogout extends whatsappstates{}
class homechangecurrntnevstate extends whatsappstates{}
class pickerprofilesucsses extends whatsappstates{}
class pickerprofileerror extends whatsappstates{}
class pickercoversucsses extends whatsappstates{}
class pickercovererror extends whatsappstates{}
class updateloding extends whatsappstates{}
class updateerror extends whatsappstates{}
class uploadcoversucsses extends whatsappstates{}
class uploadcovererror extends whatsappstates{}
class uploadprofilesucsses extends whatsappstates{}
class uploadprofileerror extends whatsappstates{}
class uploadpostsucsses extends whatsappstates{}
class pickpostsucsses extends whatsappstates{}
class uploadimagepostsucsses extends whatsappstates{}
class uploadposterror extends whatsappstates{}
class deletpostphoto extends whatsappstates{}
class likebuld extends whatsappstates{}
class likebuldsucsses extends whatsappstates{}
class likebulderror extends whatsappstates{}
class whatsappgetlikessuccses extends whatsappstates{}
class whatsappgetlikesserror extends whatsappstates{}
class whatsappgetallusererror extends whatsappstates{}
class whatsappgetallusersucsses extends whatsappstates{}
class whatsappsendmassgeerror extends whatsappstates{}
class whatsappsendmassgesucsses extends whatsappstates{}
class whatsappgetallmassgesucsses extends whatsappstates{}
class changecolors extends whatsappstates{}