
emptyValidation(value) {
  if (value == null || value.isEmpty) {
    return 'This field is required';
  } else {
    return null;
  }
}
passwordValidation(value){
  if (value.isEmpty) {
    return 'This field is required';
  }
  if (value.length <=6) {
    return null;
  }

}


