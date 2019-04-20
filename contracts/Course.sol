pragma solidity ^0.5.0;

contract Course {
	struct Course_model {
		uint rubric;
		string course_name;
		string instructor;
		string venue ;
		string capacity; 
	}

	mapping (uint => Course_model) public courses;
	
	//registered users
	address[] public arr;
	uint public no_courses;
	address owner;
	
	//to display message
	event updateStatus(string _msg);
	
	//Constructor
	constructor () public {
		emit updateStatus('Contract deployed!');
		no_courses=0;
		arr.push(0xcD2fb51F9bd9fE572C91970E5B7248E94f3828d5);
		arr.push(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c);
		arr.push(0x720Cc877b59356179770369c3791cE15ec5cCB9c);
 		arr.push(0x357D9375f60D6995F461097C82360d9bB0e009BB);
		arr.push(0xfD95766dAA72007F595ca112091B997eE5D45A29);
	}
	
	modifier onlyOwner() {
		require(msg.sender == owner);
		_;
	}
	
	
	//converts the caller's address to string
// 	function toString1(address x) internal pure returns (string memory) {
//         bytes memory b = new bytes(20);
//         for (uint i = 0; i < 20; i++)
//             b[i] = byte(uint8(uint(x) / (2**(8*(19 - i)))));
//         return string(b);
//     }
	
	//comapres strings (addresses)
// 	function stringsEqual(address _a, string memory _b)  internal pure returns (bool) {
// 	bytes memory a = bytes(_a);	
// 	bytes memory b = bytes(_b);
// 	uint num1 = a.length;
// 	uint num2 = b.length;
// 	if (a.length != b.length)
// 		return false;
// 	// @todo unroll this loop
// 	for (uint i = 0; i < a.length; i ++)
// 		if (a[i] != b[i])
// 			return false;
// 	return true;
// 	}
	
	//checks that only registered users can call
	modifier ifIssuer()
	{
		for (uint i=0; i<arr.length; i++)
			{
				// string memory senderString = toString1(msg.sender);
				// address user = arr[i];
				// if(stringsEqual(user, senderString))
				// 	_;
				if(arr[i]==msg.sender)
				{
				    _;
				}
			}
	}

	function addCourse (uint _rubric, string memory _course_name , string memory _instructor, string memory _venue, string memory _capacity) public 
	ifIssuer{
		// set msg.sender to run this fuction by specific users
		
		courses[no_courses] = Course_model(_rubric,_course_name,_instructor,_venue,_capacity);
		no_courses=no_courses+1;
		
	}
	
}
