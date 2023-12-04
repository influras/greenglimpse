class AuthService {
  Future<bool> registerCustomer(String firstName, String lastName,  
  String email, String password) async {
    
    // Simulate registration by printing the provided email and password
    print('Registration email: $email, password: $password');
    
    

    // Return true to indicate successful registration
    return true;
  }
}