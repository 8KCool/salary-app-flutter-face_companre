class UserModal {
  int userId;
  String name;
  String emailId;
  String gender;
  String city;
  String country;
  String phone;
  String address;
  String profile_img;
  String token;
  String branchId;
  String? companyName;

  UserModal({
    // required this.client_emp,
    required this.userId,
    required this.name,
    required this.emailId,
    required this.gender,
    required this.city,
    required this.country,
    required this.phone,
    required this.address,
    required this.profile_img,
    required this.token,
    required this.branchId,
    this.companyName,
  });

  factory UserModal.fromJson(Map userData) {
    return UserModal(
        userId: userData['client_emp'] == null ? 1 : userData['client_emp'],
        name: userData['name'] ?? 'dummy name',
        emailId: userData['email'] ?? '',
        gender: userData['gender'].toString() ?? '',
        city: userData['oc_city'] ?? '',
        country: userData['oc_country'] ?? '',
        phone: userData['phone_number'] ?? '',
        address: userData['postal_address'] ??'',
        profile_img: userData['profileImage'] ?? 'https://salarydocument.fra1.digitaloceanspaces.com/employeeprofile/cogKO4E3ks7sImNupnLt21rPwsHFfWncaHhhtmru.png',
        token: userData['token'] ?? '',
        branchId: userData['branch_id'] ?? '',
        companyName: userData['oc_company_name']??''
//     "id": 144,
//     "client_emp": null,
//     "plan_id": null,
//     "name": "f6f6",
//     "email": "yfyf@gmail.com",
//     "mobile": "8357086224",
//     "role": 20,
//     "lead_id": 14,
//     "client_id": "a9eJDeUA",
//     "plan_subscribed": null,
//     "plan_expired": null,
//     "email_verified_at": null,
//     "oc_company_name": "boo",
//     "oc_name": null,
//     "oc_email": null,
// "oc_mobile": null,
// "oc_address": null,
// "oc_city": null,
// "oc_pincode": null,
// "oc_state": null,
// "oc_country": null,
// "oc_total_employees": null,
// "oc_sameas_ac": null,
// "ac_company_name": null,
// "ac_name": null,
// "ac_email": null,
// "ac_mobile": null,
// "ac_address": null,
// "ac_city": null,
// "ac_pincode": null,
// "ac_state": null,
// "ac_country": null,
// "bc_company_name": null,
// "bc_name": null,
// "bc_email": null,
// "bc_mobile": null,
// "bc_address": null,
// "bc_city": null,
// "bc_pincode": null,
// "bc_state": null,
// "bc_country": null,
// "tc_company_name": null,
// "tc_name": null,
// "tc_email": null,
// "tc_mobile": null,
// "tc_address": null,
// "tc_city": null,
// "tc_pincode": null,
// "tc_state": null,
// "tc_country": null,
// "created_at": "2022-08-26T06:16:56.000000Z",
// "updated_at": "2022-08-26T06:16:56.000000Z",
// "billing_type": null,
// "plan_type": null,
// "status": "1",
// "avatar": null,
// "salary": null,
// "google_id": null,
// "dob": null,
// "gender": null,
// "aadhar_number": null,
// "pan_number": null,
// "uan_number": null,
// "pf_number": null,
// "esi_number": null,
// "isprofilecomplete": "No",
// "no_staff": 50,
// "roles": [
// {
// "id": 20,
// "name": "Admin",
// "guard_name": "web",
// "created_at": "2022-07-15T04:49:46.000000Z",
// "updated_at": "2022-07-15T05:34:30.000000Z",
// "pivot": {
// "model_id": 144,
// "role_id": 20,
// "model_type": "App\\Models\\User"
// }
// }
// ]
// },
// "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWY1OWI0NWJmODg1YTI0OGQxNGQ2YTE4ZDFmNTczODg4MDUzYjUwZmQxMzU3YmIyMmRkMWNmYTYyZTU4ZGNmOWFlMWRmODNlNDU1ZGJhODgiLCJpYXQiOjE2NjE1MDk5NzYuNjg2OTg5MDY4OTg0OTg1MzUxNTYyNSwibmJmIjoxNjYxNTA5OTc2LjY4Njk5Mjg4MzY4MjI1MDk3NjU2MjUsImV4cCI6MTY5MzA0NTk3Ni42ODA5Mjc5OTE4NjcwNjU0Mjk2ODc1LCJzdWIiOiIxNDQiLCJzY29wZXMiOltdfQ.L7yanP5dRI7MkgFcgcEST2OJxRvRmVAwjCQbgF-vcESFfOBEorglHMQ_ohCBNeXhtszaDM3Lr4lNgggsK83qqE3m7BZmG47OHCVRY8VBx_cnobmTfsM8vgxCAyeqTdtz9fh9ueCCWSyOoWwpDvn05v0TRCuMlAhngcw_NXi8uU-2cwyB7WCzxHI8r_d-3tYui8j-1QvQEyBwBqzfxsZhwt0vE5nF35bxIqF9Nu0Mp4J814nSxy2fmG1zgYMsLUNXHWuysZ0NKTF9brIzdiuGfxcxZagjuWdPxfk3ZeEEZyJvZJ3NgM7uFspyBS1ZkgxjWf4jFcfDwQCUx08ynkKtrpEV4nLtDkiH5zs4dx4avLeFPzKy22RzgcC37VIAya9M-LVLPxzpH8y_q6HnWqt9TiGniKWmkMSYo2DnVs2QPlGT-pfS6VBIzxnmbhOf3OFbfK-UjvybpsR7pSTdU7STZqpdF1eGVaeYhdv6YtOySMQwtnH9zXfC7SWkBCZLitFGX7ac3ixAH6-ILfmT2mQOwop0YCvynRzVN3iYgXP-jyi3jb1Saspe_UmanZ-7spHuO1ZjXC9-qHo45Yvcn6DzizRnYKlV91WCybBecLZND7AnF-J5fGEiWnW-4dnvGASKjFl7vQ4fkuAGvQlEZy_Qhxq8VOvORTzcS8wJjokaWnA"
// }
        );
  }
}
