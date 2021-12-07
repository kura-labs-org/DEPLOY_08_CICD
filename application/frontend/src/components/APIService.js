export default class APIService {
    static UpdateArticle(id, body) {
        return fetch(`http://production-1243623148.us-east-1.elb.amazonaws.com/app/update/${id}/`, {
            'method':'PUT',
            headers: {
              'Content-Type':'application/json'
      
            },
            body: JSON.stringify(body)
          })
          .then(resp => resp.json())
    }

    static InsertArticle(body) {
        return fetch(`http://production-1243623148.us-east-1.elb.amazonaws.com/app/add`, {
            'method':'POST',
            headers: {
              'Content-Type':'application/json'
      
            },
            body: JSON.stringify(body)
          })
          .then(resp => resp.json())
    }


    static DeleteArticle(id) {
        return fetch(`http://production-1243623148.us-east-1.elb.amazonaws.com/app/delete/${id}/`, {
            'method':'Delete',
            headers: {
              'Content-Type':'application/json'
      
            },
            
          })
          
    }



}


