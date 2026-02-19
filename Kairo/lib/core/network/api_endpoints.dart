/// Static API endpoint path constants.
///
/// Centralizes all API routes in one place to avoid
/// hardcoded strings throughout the data layer.
class ApiEndpoints {
  const ApiEndpoints._();

  // -- Auth --
  /// POST: Login with email and password.
  static const String login = '/auth/login';

  /// POST: Register a new user.
  static const String register = '/auth/register';

  /// POST: Request password reset email.
  static const String forgotPassword = '/auth/forgot-password';

  /// POST: Verify OTP code.
  static const String verifyOtp = '/auth/verify-otp';

  /// POST: Refresh the access token.
  static const String refreshToken = '/auth/refresh-token';

  /// POST: Logout and invalidate tokens.
  static const String logout = '/auth/logout';

  /// GET: Fetch the current user profile.
  static const String me = '/auth/me';

  // -- Notes --
  /// CRUD: Notes resource.
  static const String notes = '/notes';
}
