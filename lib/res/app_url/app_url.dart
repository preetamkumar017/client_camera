

class AppUrl {

  static const String baseUrl = 'https://reqres.in' ;
  static const String loginApi = '$baseUrl/api/login' ;

  static const String userListApi = 'https://webhook.site/3c05a17b-3c4e-4f07-96f6-c613b4df4d74' ;

  static const String imageUrl  = "https://ukcdesigner.in/site_camera_data/";

  // static var mainUrl = 'http://192.168.1.4:80/approvalzone/index.php';
  // static var subMainUrl = 'http://192.168.1.4:80/approvalzone/';
  // static const String bookingFormUrl  = "http://192.168.1.4/approvalzone/index.php/ClientManagerApi";
  static const String bookingFormUrl  = "https://ukcdesigner.in/approvalzone/index.php/ClientManagerApi";
  static var mainUrl = 'https://ukcdesigner.in/approvalzone/index.php';
  static var subMainUrl = 'https://ukcdesigner.in/approvalzone/';

  static const String login = '$bookingFormUrl/login' ;


  static const String ajaxClientInfoUrl  = "$bookingFormUrl/ajax_client_info";
  static const String ajaxDecisionMaker  = "$bookingFormUrl/ajax_decision_maker";
  static const String ajaxClientPayee  = "$bookingFormUrl/ajax_client_payee";
  static const String ajaxBookingTransaction  = "$bookingFormUrl/ajax_booking_transaction";
  static const String ajaxPlotDetails  = "$bookingFormUrl/ajax_plot_details";
  static const String ajaxAttachedDocument  = "$bookingFormUrl/ajax_attached_document";
  static const String bookingList  = "$bookingFormUrl/booking_list";
  static const String bookingDetails  = "$bookingFormUrl/booking_details";
  static const String commitmentList  = "$bookingFormUrl/commitment_list";
  static const String addCommitment  = "$bookingFormUrl/addCommitment";
  static const String commitment  = "$bookingFormUrl/getCommit";
  static const String dashboard  = "$bookingFormUrl/dashboard";
  static const String profile  = "$bookingFormUrl/profile";
  static const String deleteBooking  = "$bookingFormUrl/ajax_truncate";


  // static var cctvMain =  'http://192.168.1.4/approvalzone/index.php/ClientManagerApi';
  static var cctvMain =  'https://ukcdesigner.in/approvalzone/index.php/ClientManagerApi' ;
  static var cctvDetails =  '$cctvMain/cctv_details' ;
  static var manualUploadedImage =  '$cctvMain/manualUploadedImages/' ;



}