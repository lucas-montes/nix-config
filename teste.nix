let
  # Define a string or any value
  message = "Hello, Nix!";
  alsog = str: "hey" + str + message;
in
# Print the message to the consol
builtins.trace (alsog "lucas") null

