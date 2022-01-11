<cfcomponent extends="Layout">
	
    <cfset fields=array(
		)>
    
	<cffunction name="getClass" returntype="string">
    	<cfreturn left(getConfigSettings().log4j.version,1)==1?"lucee.commons.io.log.log4j.layout.ClassicLayout":"lucee.commons.io.log.log4j2.layout.ClassicLayout">
    </cffunction>
    
	<cffunction name="getLabel" returntype="string" output="false">
    	<cfreturn "Classic">
    </cffunction>
	<cffunction name="getDescription" returntype="string" output="no">
    	<cfreturn "Same logging layout as with Lucee 1 - 4.1">
    </cffunction>
    
</cfcomponent>