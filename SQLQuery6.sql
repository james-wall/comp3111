SELECT firstName, lastName, email, HKIDPassportNumber
FROM Client, SecurityHolding
WHERE
	Client.accountNumber = SecurityHolding.accountNumber and SecurityHolding.type = 'stock' and SecurityHolding.code = 22
ORDER BY lastName