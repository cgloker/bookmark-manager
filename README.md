# bookmark-manager
A web app that stores web bookmarks in a database.

## User Story

As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager

## To setup the database from scratch you will need to do the following things:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
