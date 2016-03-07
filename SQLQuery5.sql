SELECT accountType, COUNT(accountType)
FROM Account
GROUP BY accountType