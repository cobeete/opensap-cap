using { sap.capire.bookshop as my } from '../db/schema';
service CatalogService @(path:'/browse') {

  @readonly entity Books as SELECT from my.Books { *,
    author.name as author, author.age as authorAge
  } excluding { createdBy, modifiedBy };

  @requires_: 'authenticated-user'
  @insertonly entity Orders as projection on my.Orders;
}