echo "Enter Username And Password of OS_Test_Site"

echo -e "\nEnter UserName"
read UserName

echo -e "\nEnter Password"
read Password

while true
do
	echo -e "\nEnter 1 to Create the Site"
	echo "Enter 2 to Create the User"
	echo "Press CTRL+C to Stop the Execution"
	read Input

	siteCreation=1
	userCreation=2

	if [ $Input == $siteCreation ]
	then 
	    curl --user $UserName:$Password https://test.openspecimen.org/os-mysql/rest/ng/sites
	    echo -e "\nPlease enter Intitute Name:"
	    read instituteName
	    echo -e "\nPlease enter Name:"
	    read Name
	    echo -e "\nPlease enter code:"
	    read code
            echo -e "\nPlease enter Coordinators:"
	    read Coordinators
	    echo -e "\nPlease enter Type:"
	    read Type	
	    echo -e "\nPlease enter Address:"
	    read Address
	    
	    curl --user $UserName:$Password --header "Content-Type: application/json" --request POST --data '{"institureName": "'"$instituteName"'","name":"'"$Name"'","code":"'"$code"'","coordinators":"'"$Cordinators"'","type":"'"$Type"'","address":"'"$Address"'"}' https://test.openspecimen.org/os-mysql/rest/ng/institutes/

    
	elif [ $Input == $userCreation ]
	then
	    curl --user $UserName:$Password https://test.openspecimen.org/os-mysql/rest/ng/users
	    echo -e "\nPlease enter Type of User:"
	    read userType
	    echo -e "\nPlease enter First Name:"
	    read firstName
	    echo -e "\nPlease enter Last Name:"
	    read lastName
            echo -e "\nPlease enter Email Address:"
	    read emailAddress
	    echo -e "\nPlease enter Phone Number:"
	    read phoneNumber
	    echo -e "\nPlease enter Login Name:"
	    read loginName
	    echo -e "\nPlease enter Institute Name:"
	    read instituteName
	    echo -e "\nPlease enter Primary Site:"
	    read primarySite
	    echo -e "\nPlease enter Time Zone:"
            read timeZone
	    echo -e "\nPlease enter Address:"
	    read Address

	    curl --user $UserName:$Password --header "Content-Type: application/json" --request POST --data '{"type":"'"$userType"'","firstName":"'"$firstName"'","lastName":"'"$lastName"'","emailAddress":"'"$emailAddress"'","phoneNumber":"'"$phoneNumber"'","loginName":"'"$loginName"'","instituteName":"'"$instituteName"'","primarySite":"'"$primarySite"'","timeZone":"'"$timeZone"'","address":"'"$Address"'"}' https://test.openspecimen.org/os-mysql/rest/ng/users
	    
	else 
	    echo "Your Input is Wrong!!"
	fi
done
