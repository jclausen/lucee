component extends="org.lucee.cfml.test.LuceeTestCase"{
	function beforeAll(){
		variables.path ="#getDirectoryFromPath(getCurrenttemplatepath())#LDEV1388\";
		if(not directoryExists("#path#uploads")){
			Directorycreate("#path#uploads");
		}
	}

	function run( testResults , testBox ) {
		describe( "Test suite for LDEV-1388", function() {
			it(title="checking CMYK image using cfimage tag, with action='resize' ", body = function( currentSpec ) {
				cfimage (action="resize", source="#path#/cmyk_1.jpg", destination="#path#uploads/resize.jpg", height="333",  width="500" , overwrite="yes");
				expect(IsImageFile( "#path#uploads/resize.jpg" )).toBe("true");
			});

			it(title="checking CMYK image using cfimage tag, with action='convert' ", body = function( currentSpec ) {
				cfimage (action="convert", source="#path#/cmyk_1.jpg", destination="#path#uploads/convert.png", format="png" , overwrite="yes");
				expect(IsImageFile( "#path#uploads/convert.png" )).toBe("true");
			});

			it(title="checking CMYK image using cfimage tag, with action='write' ", body = function( currentSpec ) {
				cfimage (action="convert", source="#path#/cmyk_1.jpg", destination="#path#uploads/write.jpg", overwrite="yes");
				expect(IsImageFile( "#path#uploads/write.jpg" )).toBe("true");
			});
		});
	}
}