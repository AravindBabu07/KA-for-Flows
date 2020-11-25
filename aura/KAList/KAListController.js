({
    onKALoaded: function( component, event, helper ) {
        var cols = [
            {
                'label': 'Title',
                'fieldName': 'Title',
                'type': 'text'
            },
            {
                'label': 'View Count',
                'fieldName': 'ArticleTotalViewCount',
                'type': 'number'
            },
         {
                'label': 'Action',
                'type': 'button',
                'typeAttributes': {
                    'label': 'View details',
                    'name': 'view_details'
                }
         }
            
        ];
        component.set( 'v.cols', cols );
        component.set( 'v.rows', event.getParam( 'ka') );
    },
    onRowAction: function( component, event, helper ) {
        var action = event.getParam( 'action' );
        var row = event.getParam( 'row' );
        if ( action.name == 'view_details' ) {
            var navigation = component.find( 'navigation' );
            navigation.navigate({
                'type': 'standard__recordPage',
                'attributes': {
                    'objectApiName': 'Knowledge__kav',
                    'recordId': row.Id,
                    'actionName': 'view'
                }
            });
        }
    }
})