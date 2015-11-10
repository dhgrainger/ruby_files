def validPhoneNumber(phoneNumber)
  if (phoneNumber =~ ^([0-9\(\)\/\+ \-]*))
   return true
  end
end

validPhoneNumber("(508)280-3560")
