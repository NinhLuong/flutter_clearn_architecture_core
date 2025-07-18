// ThinhNguyen
// 11:50 16/9/24

class AuthStringQuery {
  static const String checkFireBaseAccount = r"""
  mutation CheckFireBaseAccount(
    $idToken: String!
    $uuid: String!
    $uid: String!
    $deviceName: String!
    $deviceType: Int
    $subscriptionId: String
    ) {
      checkFireBaseAccount(
        idToken: $idToken
        uuid: $uuid
        uid: $uid
        deviceName: $deviceName
        deviceType: $deviceType
        subscriptionId: $subscriptionId
      ) {
        data {
          accessToken
          refreshToken
        }
      }
    }
  """;

  static const String guestLogin = r"""
  mutation CreateUserBeforeLogin($uuid: String!, $subscriptionId: String) {
    createUserBeforeLogin(uuid: $uuid, subscriptionId: $subscriptionId) {
      data {
        accessToken
        refreshToken
      }
    }
  }
  """;

  static const String refreshAuthInfo = r"""
    mutation RefreshUserToken($refreshToken: String!) {
      refreshUserToken(refreshToken: $refreshToken) {
        refreshToken
        accessToken
      }
    }
  """;
}
