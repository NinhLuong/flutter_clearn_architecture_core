// ThinhNguyen
// 13:56 25/9/24

class UserStringQuery {
  static const String fetchUserInfo = r"""
    query Data($subscriptionId: String) {
      findMyUserInfo(subscriptionId: $subscriptionId) {
        user { 
          id
          config
          userProfile: profile {
            id
            imgUrl
            firstName
            lastName
            displayName
            dateOfBirth
            email
            phoneNumber
          }
          childProfiles {
            id
            name
            gender
            dateOfBirth
          }
          userRoles: userRole {
            id
            name
          }
        }
      }
    }
    """;

  static const String loadOneSignalUserInfo = r"""
      query Query($subscriptionId: String) {
        loadOneSignalUserInfo(subscriptionId: $subscriptionId)
      }
    """;
}
