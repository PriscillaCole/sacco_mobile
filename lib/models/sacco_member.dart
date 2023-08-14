class SaccoMember {
  int? id;
  String? saccoId;
  String? userId;
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? image;
  String? nationality;
  int? identificationNumber;
  String? physicalAddress;
  String? postalAddress;
  String? email;
  int? phoneNumber;
  String? employmentStatus;
  String? employerName;
  int? monthlyIncome;
  int? bankAccountNumber;
  String? bankName;
  String? membershipType;
  String? membershipId;
  String? dateOfJoining;
  String? nextOfKinName;
  int? nextOfKinContact;
  String? beneficiaryName;
  String? beneficiaryRelationship;
  String? status;
  String? password;

  SaccoMember(
      {this.saccoId,
      this.userId,
      this.fullName,
      this.dateOfBirth,
      this.gender,
      this.image,
      this.nationality,
      this.identificationNumber,
      this.physicalAddress,
      this.postalAddress,
      this.email,
      this.phoneNumber,
      this.employmentStatus,
      this.employerName,
      this.monthlyIncome,
      this.bankAccountNumber,
      this.bankName,
      this.membershipType,
      this.membershipId,
      this.dateOfJoining,
      this.nextOfKinName,
      this.nextOfKinContact,
      this.beneficiaryName,
      this.beneficiaryRelationship,
      this.status,
      this.password, required int id});

  SaccoMember.fromJson(Map<String, dynamic> json) {
    saccoId = json['sacco_id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    image = json['image'];
    nationality = json['nationality'];
    identificationNumber = json['identification_number'];
    physicalAddress = json['physical_address'];
    postalAddress = json['postal_address'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    employmentStatus = json['employment_status'];
    employerName = json['employer_name'];
    monthlyIncome = json['monthly_income'];
    bankAccountNumber = json['bank_account_number'];
    bankName = json['bank_name'];
    membershipType = json['membership_type'];
    membershipId = json['membership_id'];
    dateOfJoining = json['date_of_joining'];
    nextOfKinName = json['next_of_kin_name'];
    nextOfKinContact = json['next_of_kin_contact'];
    beneficiaryName = json['beneficiary_name'];
    beneficiaryRelationship = json['beneficiary_relationship'];
    status = json['status'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sacco_id'] = saccoId;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['image'] = image;
    data['nationality'] = nationality;
    data['identification_number'] = identificationNumber;
    data['physical_address'] = physicalAddress;
    data['postal_address'] = postalAddress;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['employment_status'] = employmentStatus;
    data['employer_name'] = employerName;
    data['monthly_income'] = monthlyIncome;
    data['bank_account_number'] = bankAccountNumber;
    data['bank_name'] = bankName;
    data['membership_type'] = membershipType;
    data['membership_id'] = membershipId;
    data['date_of_joining'] = dateOfJoining;
    data['next_of_kin_name'] = nextOfKinName;
    data['next_of_kin_contact'] = nextOfKinContact;
    data['beneficiary_name'] = beneficiaryName;
    data['beneficiary_relationship'] = beneficiaryRelationship;
    data['status'] = status;
    data['password'] = password;
    return data;
  }
}