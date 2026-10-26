import 'file_attachment_models.dart';

class ReportFraudFlowData {
  static String currentCaseNumber = '';
  static String currentReportTitle = 'Report Fraud / Theft';
  static String organisation = '';
  static String location = '';
  static String incident = '';
  static String personInvolved = '';
  static String incidentDate = '';
  static String additionalInformation = '';
  static String attention = '';
  static String fullName = '';
  static String phoneNumber = '';
  static String emailAddress = '';
  static List<AttachmentItem> attachments = [];
  static bool rewardOptIn = false;
  static String rewardFullName = '';
  static String rewardContactNumber = '';
  static String rewardEmailAddress = '';
  static String rewardPhysicalAddress = '';
  static String? rewardNationalIdPath;

  static void resetReport() {
    currentCaseNumber = '';
    organisation = '';
    location = '';
    incident = '';
    personInvolved = '';
    incidentDate = '';
    additionalInformation = '';
    attention = '';
    fullName = '';
    phoneNumber = '';
    emailAddress = '';
    attachments = [];
    resetRewardsDetails();
  }

  static void resetRewardsDetails() {
    rewardOptIn = false;
    rewardFullName = '';
    rewardContactNumber = '';
    rewardEmailAddress = '';
    rewardPhysicalAddress = '';
    rewardNationalIdPath = null;
  }
}
