(ns berita.db.news
  (:require [berita.db.core :refer [*db*]]
            [clojure.java.jdbc :as jdbc]
            [honeysql.core :as sql]))

(defn create-query [news]
  (-> (insert-into :news)
      (values [news])
      (sql/format)))

(defn create! [news]
  (jdbc/execute! *db* (create-query news)))

(defn query [category])
