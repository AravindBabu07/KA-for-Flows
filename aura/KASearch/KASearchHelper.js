({
    // code in the helper is reusable by both
    // the controller.js and helper.js files
    handleSearchDataCateogry: function( component, searchTerm ) {
        var action = component.get( "c.getArticlesList" );
        action.setParams({
            searchString: searchTerm ,
            dataCategory :  component.find('select').get('v.value')
        });
        action.setCallback( this, function( response ) {
           var resposneResult = response.getReturnValue();
            //alert("Result"+resposneResult);
            var event = $A.get( "e.c:KALoaded" );
            event.setParams({
                "ka": resposneResult
            });
            event.fire();
        });
        $A.enqueueAction( action );
    },
        handleSearch: function( component, searchTerm ) {
        //alert("Inside search function"+searchTerm);
        var action = component.get( "c.getSearchArticlesList");
        action.setParams({
            searchString: searchTerm 
        });
        action.setCallback( this, function( response ) {
           var resposneResult = response.getReturnValue();
            //alert("Result"+resposneResult);
            var event = $A.get( "e.c:KALoaded" );
            event.setParams({
                "ka": resposneResult
            });
            event.fire();
        });
        $A.enqueueAction( action );
    }
})