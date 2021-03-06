<!DOCTYPE html>
<html lang="en"
      xmlns:th="http://www.thymleaf.org"
>
<head>
    <meta charset="UTF-8">
    <title>Models</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
    <table class="table table-striped table-hover">
        <thead class="thead-light">
            <tr>
                <th th:if="${false}">Id</th>
                <th>Nom</th>
                <th>Fournisseur</th>
            </tr>
            <tr>
                <td th:if="${false}" th:text="est"></td>
                <form id="modelForm" action="#" th:action="@{/models}" method="post">
                    <td class="input-group">
                        <div class="input-group-prepend">
                            <button id="name-submit" class="input-group-text" type="submit" >&#x1F50D;</button>
                        </div>
                        <input type="text" class="form-control" placeholder="Chercher" aria-label="Name" name="name" th:value="${name}">
                    </td>
                </form>
                <form id="supplierForm" action="#" th:action="@{/models}" method="post">
                    <td class="input-group">
                        <div class="input-group-prepend">
                            <button id="supplier-submit" class="input-group-text" type="submit" >&#x1F50D;</button>
                        </div>
                        <select class="selectpicker" id="dropDownList" multiple>
                            <option th:each="supplier:${suppliers}" th:value="${supplier.name}" th:text="${supplier.name}"></option>
                        </select>
                    </td>
                </form>
            </tr>
        </thead>
        <tbody>
            <tr th:each="m:${models}">
                <td th:if="${false}" th:text="${m.id}"></td>
                <td th:text="${m.name}"></td>
                <td th:text="${m.supplier.name}"></td>
            </tr>
        </tbody>
    </table>
    <nav aria-label="Pagination" th:if="${totalPages != null && totalPages.size() > 0}">
        <ul class="pagination">
            <li class="page-item disabled" th:if="${currentPage.number == 0}">
                <span class="page-link" >&laquo;</span>
            </li>
            <li class="page-item" th:if="${currentPage.number > 0}">
                <a class="page-link" th:href="@{/models(page=${currentPage.number - 1})}">&laquo;</a>
            </li>
            <li th:each="p:${totalPages}" class="page-item" th:classappend="${p == currentPage.number } ? active">
                <span th:if="${p == currentPage.number }" class="page-link disabled"  th:text="${p + 1}"></span>
                <a th:if="${p != currentPage.number }" class="page-link" th:text="${p + 1}" th:href="@{/models(page=${p + 1})}"></a>
            </li>
            <li class="page-item disabled" th:if="${currentPage.number == totalPages.size() - 1}">
                <span class="page-link">&raquo;</span>
            </li>
            <li class="page-item" th:if="${currentPage.number < totalPages.size() - 1}">
                <a class="page-link" th:href="@{/models(page=${currentPage.number + 1})}">&raquo;</a>
            </li>
        </ul>
    </nav>
</body>
</html>