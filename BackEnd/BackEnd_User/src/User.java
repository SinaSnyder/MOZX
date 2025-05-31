public class User {

    private String name;
    private String email;
    private String password;
    private String phoneNumber;
    private double wallet;
    private boolean premium;
    private boolean logIn;
    private boolean signUp;

    public User(String name, String email, String password, String phoneNumber, double wallet, boolean premium, boolean logIn, boolean signUp) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.wallet = wallet;
        this.premium = premium;
        this.logIn = logIn;
        this.signUp = signUp;
    }

    // Getters & Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public double getWallet() { return wallet; }
    public void setWallet(double wallet) { this.wallet = wallet; }

    public boolean isPremium() { return premium; }
    public void setPremium(boolean premium) { this.premium = premium; }

    public boolean isLogIn() { return logIn; }
    public void setLogIn(boolean logIn) { this.logIn = logIn; }

    public boolean isSignUp() { return signUp; }
    public void setSignUp(boolean signUp) { this.signUp = signUp; }





    public boolean validateLogin(String email, String password) {
        return false;
    }

    public void login() {
    }

    public void logout() {
    }

    public void signUp() {
    }

    public boolean checkPremiumStatus() {
        return premium;
    }

    public void addToWallet(double amount) {
    }

    public boolean withdrawFromWallet(double amount) {
        return false;
    }

    public void updateProfile(String newName, String newEmail, String newPhone) {
    }

    public boolean changePassword(String oldPass, String newPass) {
        return false;
    }

}
