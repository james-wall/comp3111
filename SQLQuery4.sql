SELECT Account.accountNumber
from Account 
except 
	SELECT Account.accountNumber 
	from Account, SecurityHolding
	Where Account.accountNumber = SecurityHolding.accountNumber
