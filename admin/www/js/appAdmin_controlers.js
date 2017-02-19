/* global angular, CryptoJS */

var appAdmin = angular.module('appAdmin');

appAdmin.factory('AuthError', function () {
    return {error: ''};
});

// login page
appAdmin.controller('loginCtrl', function ($scope, $http, $location, AuthError) {
    $scope.login = function ($user) {
        $http.post("/api/admin/login.php", {username: $user.Name, password: CryptoJS.SHA256($user.Password).toString(CryptoJS.enc.Base64)})
                .success(function ($response) {
                    if ($response.error !== null) {
                        $scope.error = $response.message;
                    } else {
                        AuthError.error = '';
                        $location.path('/Administracia');
                    }
                });

    };

    $scope.error = AuthError.error;
});

// logged page
appAdmin.controller('adminCtrl', function ($scope, $http, $location, AuthError) {

});

appAdmin.controller('onasCtrl', function ($scope, $http, $location, AuthError) {
    ResetMessages($scope);

    $scope.loadOnas = function () {
        $http.post("/api/admin/getOnas.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $('.summernote').code(response.message);
                    });
                });
    };

    $scope.saveOnas = function () {
        ResetMessages($scope);

        $http.post("/api/admin/saveOnas.php", {text: $('.summernote').code()})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                    });
                })
                .error(function () {
                    $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                });
    };

    $test = $('.summernote').code();
    $scope.loadOnas();
});

appAdmin.controller('triedyCtrl', function ($scope, $http, $location, AuthError) {
    var defaultValues = {
        id: 0,
        image: "i_23teacher",
        name: "",
        empTitle: "",
        emp1: {name: "", id: 0},
        emp2: {name: "", id: 0},
        order: ""
    };

    $scope.modalDialog = "/view/admin/modals/triedy.html";

    ResetMessages($scope);

    $scope.toggleModal = function () {
        $scope.modalDialog = "/view/admin/modals/triedy.html";
        $scope.msClass = angular.copy(defaultValues);
        $scope.msClass.order = GetLatestListOrder($scope.allClasses) + 1;
        $scope.isModalShown = !$scope.isModalShown;
        $scope.submitted = false;
        ResetMessages($scope);
        $scope.modalTitle = "Nová trieda";
    };

    $scope.openReorderModal = function () {
        $scope.modalTitle = "Zoradiť triedy";

        for (var i = 0; i < $scope.allClasses.length; i++) {
            $scope.allClasses[i].title = $scope.allClasses[i].name;
        }
        ;

        ToggleReorderModal($scope, $scope.allClasses);
    };

    $scope.cancelReorderModal = function () {
        $scope.isModalShown = !$scope.isModalShown;
        $scope.allClasses = $scope.backUpList;
        ResetMessages($scope);
    };

    $scope.saveReorderModal = function () {
        SaveReorderModal($scope, $http, $location, AuthError, 'reorderClasses');
    };

    $scope.saveClass = function (form) {
        ResetMessages($scope);
        $scope.submitted = true;

        if (form.$valid) {
            $http.post("/api/admin/saveClass.php", $scope.msClass)
                    .success(function (response) {
                        ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                            $scope.infoMessage = response.message;
                            setTimeout($scope.getClasses(), 1000);
                        });

                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                    })
                    .error(function () {
                        $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                    });
        }
    };

    $scope.getClasses = function () {
        $http.post("/api/admin/getAllClasses.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.allClasses = response.message;
                    });
                });
    };

    $scope.getClass = function (classId) {
        $http.post("/api/admin/getClass.php", {id: classId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.toggleModal();
                        var rClass = response.message;
                        $scope.msClass = {
                            id: rClass.id,
                            image: rClass.image,
                            name: rClass.name,
                            empTitle: rClass.empTitle,
                            emp1: {name: rClass.employees[0].name, id: rClass.employees[0].id},
                            emp2: {name: rClass.employees[1].name, id: rClass.employees[1].id},
                            order: rClass.order
                        };
                        $scope.modalTitle = "Trieda - " + $scope.msClass.name;
                    });
                });
    };

    $scope.deleteClass = function (classId) {
        ResetMessages($scope);

        $http.post("/api/admin/deleteClass.php", {id: classId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        setTimeout($scope.getClasses(), 1000);
                    });
                });
    };

    $scope.getClasses();

    $scope.submitted = false;
    $scope.isModalShown = false;
    $scope.msClass = angular.copy(defaultValues);

    $scope.modalTitle = $scope.msClass.id === 0 ? "Nová trieda" : "Trieda " + $scope.msClass.name;
});

appAdmin.controller('radaCtrl', function ($scope, $http, $location, AuthError) {
    ResetMessages($scope);

    $scope.loadCouncil = function () {
        $http.post("/api/admin/getCouncil.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $('.summernote').code(response.message);
                    });
                });
    };

    $scope.saveCouncil = function () {
        ResetMessages($scope);

        $http.post("/api/admin/saveCouncil.php", {text: $('.summernote').code()})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                    });
                })
                .error(function () {
                    $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                });
    };

    $test = $('.summernote').code();
    $scope.loadCouncil();
});

appAdmin.controller('oznamyCtrl', function ($scope, $http, $location, AuthError, FileService) {
    var defaultValues = {
        id: 0,
        title: "",
        content: "",
        color: "1",
        order: ""
    };

    ResetMessages($scope);

    $scope.toggleModal = function () {
        $scope.modalDialog = "/view/admin/modals/oznamy.html";
        $scope.note = angular.copy(defaultValues);
        $scope.note.order = GetLatestListOrder($scope.allNotes) + 1;
        $('.summernote').code("");
        $scope.isModalShown = !$scope.isModalShown;
        $scope.submitted = false;
        $scope.modalTitle = "Nový oznam";
        $scope.hideFileChooser = false;
        $scope.fileLoaded = false;
        $scope.fileSending = false;
        $scope.files = null;
        $scope.noteFile = "";
        ResetMessages($scope);
    };

    $scope.openReorderModal = function () {
        $scope.modalTitle = "Zoradiť oznamy";
        ToggleReorderModal($scope, $scope.allNotes);
    };

    $scope.cancelReorderModal = function () {
        $scope.isModalShown = !$scope.isModalShown;
        $scope.allNotes = $scope.backUpList;
        ResetMessages($scope);
    };

    $scope.saveReorderModal = function () {
        SaveReorderModal($scope, $http, $location, AuthError, 'reorderNotes');
    };

    $scope.saveNote = function (form) {
        ResetMessages($scope);
        $scope.submitted = true;

        if (form.$valid) {
            $scope.note.content = $('.summernote').code();
            $http.post("/api/admin/saveNote.php", $scope.note)
                    .success(function (response) {
                        ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                            $scope.infoMessage = response.message;
                            setTimeout($scope.getNotes(), 1000);
                        });

                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                        $scope.files = null;
                        $scope.noteFile = "";
                    })
                    .error(function () {
                        $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                        $scope.files = null;
                        $scope.noteFile = "";
                    });
        }
    };

    $scope.saveNoteFile = function () {
        ResetMessages($scope);
        $scope.submitted = true;
        $scope.fileLoaded = $scope.files !== null;

        if ($scope.fileLoaded) {
            $scope.hideFileChooser = true;
            $scope.fileSending = true;
            var filePromise = FileService.saveFile($scope, "/api/admin/saveNoteFile.php");
            filePromise.then(function (result) {
                if (result.data !== null) {
                    $scope.hideFileChooser = false;
                    $scope.fileSending = false;
                    ProcessSuccessResponse(result.data, $scope, $location, AuthError, function () {
                        $scope.noteFile = result.data.message.filePath;
                    });

                    if (result.data.error !== 0) {
                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.fileSending = false;
                        $scope.submitted = false;
                        $scope.fileLoaded = false;
                    }
                } else {
                    $scope.hideFileChooser = true;
                    $scope.errMessage = "Súbor sa nepodarilo odoslať";
                    $scope.fileSending = false;
                    $scope.isModalShown = !$scope.isModalShown;
                    $scope.submitted = false;
                    $scope.fileLoaded = false;
                }
            });
        }
    };

    $scope.changeFile = function (elm) {
        $scope.files = elm.files;
        $scope.$apply();
    };

    $scope.getNotes = function () {
        $http.post("/api/admin/getAllNotes.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.allNotes = response.message;
                    });
                });
    };

    $scope.getNote = function (noteId) {
        $http.post("/api/admin/getNote.php", {id: noteId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.toggleModal();
                        $scope.note = response.message;
                        $scope.modalTitle = "Oznam - " + $scope.note.title;
                        setTimeout(function () {
                            $('.summernote').code(response.message.content);
                        }, 500);
                    });
                });
    };

    $scope.deleteNote = function (noteId) {
        ResetMessages($scope);

        $http.post("/api/admin/deleteNote.php", {id: noteId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        setTimeout($scope.getNotes(), 1000);
                    });
                });
    };

    $scope.getNotes();

    $scope.submitted = false;
    $scope.isModalShown = false;
    $scope.note = angular.copy(defaultValues);
    $scope.modalTitle = $scope.note.id === 0 ? "Nový oznam" : "Oznam " + $scope.note.name;
});

appAdmin.controller('podujatiaCtrl', function ($scope, $http, $location, $routeParams, AuthError, ImgService) {
    var classId = $routeParams.class;
    var eventModalDialog = "/view/admin/modals/podujatia.html";
    var galleryModalDialog = "/view/admin/modals/gallery.html";
    var videoGalleryModalDialog = "/view/admin/modals/videoGallery.html";

    var defaultValues = {
        id: 0,
        title: "",
        content: "",
        classId: classId,
        order: ""
    };

    $scope.modalDialog = eventModalDialog;

    ResetMessages($scope);

    $scope.toggleModal = function () {
        $scope.modalDialog = eventModalDialog;
        $scope.event = angular.copy(defaultValues);
        $scope.event.order = GetLatestListOrder($scope.allEvents) + 1;
        $('.summernote').code("");
        $scope.isModalShown = !$scope.isModalShown;
        $scope.submitted = false;
        $scope.modalTitle = "Nové podujatie";
        ResetMessages($scope);
    };

    $scope.openReorderModal = function () {
        $scope.modalTitle = "Zoradiť podujatia";
        ToggleReorderModal($scope, $scope.allEvents);
    };

    $scope.cancelReorderModal = function () {
        $scope.isModalShown = !$scope.isModalShown;
        $scope.allEvents = $scope.backUpList;
        ResetMessages($scope);
    };

    $scope.saveReorderModal = function () {
        SaveReorderModal($scope, $http, $location, AuthError, 'reorderEvents');
    };

    $scope.saveEvent = function (form) {
        ResetMessages($scope);
        $scope.submitted = true;

        if (form.$valid) {
            $scope.event.content = $('.summernote').code();
            $http.post("/api/admin/saveEvent.php", $scope.event)
                    .success(function (response) {
                        ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                            $scope.infoMessage = response.message;
                            setTimeout($scope.getEvents(), 1000);
                        });

                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                    })
                    .error(function () {
                        $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                    });
        }
    };

    $scope.getEvents = function () {
        $http.post("/api/admin/getAllEvents.php", {classId: classId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.allEvents = response.message;
                    });
                });
    };

    $scope.getEvent = function (eventId) {
        $http.post("/api/admin/getEvent.php", {id: eventId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.toggleModal();
                        $scope.event = response.message;
                        setTimeout(function () {
                            $('.summernote').code(response.message.content);
                        }, 500);
                        $scope.modalTitle = "Podujatie - " + $scope.event.title;
                    });
                });
    };

    $scope.deleteEvent = function (eventId) {
        ResetMessages($scope);

        $http.post("/api/admin/deleteEvent.php", {id: eventId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        setTimeout($scope.getEvents(), 1000);
                    });
                });
    };

    $scope.getClass = function (classId) {
        $http.post("/api/admin/getClass.php", {id: classId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        var rClass = response.message;
                        $scope.msClass = {
                            id: rClass.id,
                            name: rClass.name
                        };
                    });
                });
    };

    $scope.toggleGallery = function () {
        $scope.modalDialog = galleryModalDialog;
        angular.element("input[type='file']").val(null);
        $scope.isModalShown = !$scope.isModalShown;
        $scope.gallery = [];
        $scope.eventId = -1;
        ResetMessages($scope);
    };

    $scope.openGallery = function (eventId, eventTitle) {
        $scope.toggleGallery();
        $scope.eventId = eventId;
        $scope.getGallery($scope.eventId);
        $scope.modalTitle = eventTitle;
    };

    $scope.getGallery = function (eventId) {
        $http.post("/api/admin/getGallery.php", {eventId: eventId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.gallery = response.message;
                    });
                });
    };

    $scope.changeFile = function (elm) {
        $scope.files = elm.files;
        $scope.fileLoaded = $scope.files !== null;

        if ($scope.fileLoaded) {
            ResetMessages($scope);
            if ($scope.eventId !== -1) {
                var filePromise = ImgService.saveFile($scope);
                filePromise.then(function (result) {
                    if (result.data !== null) {
                        ProcessSuccessResponse(result.data, $scope, $location, AuthError, function () {
                            $scope.fileSending = false;
                            angular.element("input[type='file']").val(null);
                        });

                        if (result.data.error === 0) {
                            $scope.getGallery($scope.eventId);
                        }

                        $scope.fileSending = false;
                        $scope.fileLoaded = false;
                        angular.element("input[type='file']").val(null);
                    } else {
                        $scope.errMessage = "Súbor sa nepodarilo odoslať";
                        $scope.fileSending = false;
                        $scope.fileLoaded = false;
                        angular.element("input[type='file']").val(null);
                    }
                });
            }
        }
    };

    $scope.deleteImage = function (id) {
        $http.post("/api/admin/deleteImage.php", {id: id})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.getGallery($scope.eventId);
                    });
                });
    };

    $scope.toggleVideoGallery = function () {
        $scope.modalDialog = videoGalleryModalDialog;
        $scope.isModalShown = !$scope.isModalShown;
        $scope.videoGallery = [];
        $scope.video.link = "";
        $scope.errVideoMessage = "";
        $scope.eventId = -1;
        ResetMessages($scope);
    };

    $scope.openVideoGallery = function (eventId, eventTitle) {
        $scope.toggleVideoGallery();
        $scope.eventId = eventId;
        $scope.getVideoGallery($scope.eventId);
        $scope.modalTitle = eventTitle;
    };

    $scope.getVideoGallery = function (eventId) {
        $http.post("/api/admin/getVideoGallery.php", {eventId: eventId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.videoGallery = response.message;
                    });
                });
    };

    $scope.saveVideo = function (form) {
        ResetMessages($scope);
        $scope.submitted = true;

        if (form.$valid) {
            if ($scope.eventId !== -1) {

                if ($scope.video.link.startsWith("https://www.youtube.com/watch?v=")) {
                    $scope.video.link = $scope.video.link.replace('watch?v=', 'embed/');

                    $http.post("/api/admin/saveVideo.php", {link: $scope.video.link, eventId: $scope.eventId})
                            .success(function (response) {
                                ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                                    $scope.video.link = "";
                                    setTimeout($scope.getVideoGallery($scope.eventId), 1000);
                                });

                                $scope.errVideoMessage = "";
                                $scope.submitted = false;
                            })
                            .error(function () {
                                $scope.errVideoMessage = "Video sa nepodarilo uložiť.";
                                $scope.submitted = false;
                            });

                } else {
                    $scope.errVideoMessage = "Video odkaz má nesprávny formát. Správny príklad: 'https://www.youtube.com/watch?v=asdaSDDDDasd'" ;
                    $scope.submitted = false;
                }
            }
        }
    };

    $scope.deleteVideo = function (id) {
        $http.post("/api/admin/deleteVideo.php", {id: id})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.getVideoGallery($scope.eventId);
                    });
                });
    };

    $scope.getEvents();
    $scope.getClass(classId);

    $scope.submitted = false;
    $scope.isModalShown = false;
    $scope.event = angular.copy(defaultValues);
    $scope.video = {link: ""};

    $scope.modalTitle = $scope.event.id === 0 ? "Nové podujatie" : "Podujatie - " + $scope.event.name;
});

appAdmin.controller('archivCtrl', function ($scope, $http, $location, AuthError) {
    ResetMessages($scope);

    $scope.toggleModal = function (form) {
        $scope.submitted = true;
        $scope.modalDialog = "/view/admin/modals/archiv.html";
        $scope.modalTitle = "Naozaj chcete archivovať všetky existujúce podujatia?";
        if (form.$valid) {
            $scope.closeModal();
        }
    };

    $scope.closeModal = function () {
        ResetMessages($scope);

        $scope.submitted = false;
        $scope.isModalShown = !$scope.isModalShown;
    };

    $scope.doArchive = function () {

        $http.post("/api/admin/doArchive.php", {
            name: $scope.archiv.name
        })
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        $scope.archiv.name = "";
                    });
                })
                .error(function () {
                    $scope.errMessage = "Neočakávaná chyba archivácií podujatí.";
                });
        $scope.isModalShown = !$scope.isModalShown;
        $scope.submitted = false;
    };
});

appAdmin.controller('projektyCtrl', function ($scope, $http, $location, AuthError) {
    ResetMessages($scope);

    $scope.loadProjects = function () {
        $http.post("/api/admin/getProjects.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $('.summernote').code(response.message);
                    });
                });
    };

    $scope.saveProjects = function () {
        ResetMessages($scope);

        $http.post("/api/admin/saveProjects.php", {text: $('.summernote').code()})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                    });
                })
                .error(function () {
                    $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                });
    };

    $test = $('.summernote').code();
    $scope.loadProjects();
});

appAdmin.factory('FileService', function ($http) {

    var saveFile = function ($scope, $apiRequest) {
        var fd = new FormData();
        fd.append('file', $scope.files[0]);

        $scope.fileSending = true;
        return $http.post($apiRequest, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
                .success(function (response) {
                    return response;
                })
                .error(function () {
                    return null;
                });
    };
    return {saveFile: saveFile};
});

appAdmin.factory('ImgService', function ($http) {

    var saveFile = function ($scope) {
        var fd = new FormData();
        fd.append('file', $scope.files[0]);
        fd.append('eventId', $scope.eventId);

        $scope.fileSending = true;
        return $http.post("/api/admin/saveImgFile.php", fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
                .success(function (response) {
                    return response;
                })
                .error(function () {
                    return null;
                });
    };
    return {saveFile: saveFile};
});

appAdmin.controller('zverejnovanieCtrl', function ($scope, $http, $location, $routeParams, AuthError, FileService) {
    // 20 = zmluvy, 21 = faltury
    var type = $routeParams.type === 'Zmluvy' ? 20 : 21;
    var modalTitlePrefix = '';
    var modalEditTitle = '';
    if (type === 20) {
        modalTitlePrefix = 'zmluva';
        modalEditTitle = 'Zmluva';
        $scope.titleSufix = 'zmluvy';
        $scope.buttonSufix = 'zmluvu';
    } else {
        modalTitlePrefix = 'faktúra';
        modalEditTitle = 'Faktúra';
        $scope.titleSufix = 'faktúry';
        $scope.buttonSufix = 'faktúru';
    }

    var defaultValues = {
        id: 0,
        title: "",
        file: null,
        type: type
    };

    $scope.modalDialog = "/view/admin/modals/zverejnovanie.html";

    ResetMessages($scope);

    $scope.toggleModal = function () {
        $scope.doc = angular.copy(defaultValues);
        $scope.doc.order = GetLatestListOrder($scope.allDocuments) + 1;
        angular.element("input[type='file']").val(null);
        $scope.isModalShown = !$scope.isModalShown;
        $scope.submitted = false;
        $scope.fileLoaded = false;
        $scope.fileSending = false;
        $scope.modalTitle = "Nová " + modalTitlePrefix;
        $scope.hideFileChooser = false;
        ResetMessages($scope);
    };

    $scope.openReorderModal = function () {
        $scope.modalTitle = "Zoradiť " + $scope.titleSufix;

        ToggleReorderModal($scope, $scope.allDocuments);
    };

    $scope.cancelReorderModal = function () {
        $scope.isModalShown = !$scope.isModalShown;
        $scope.allDocuments = $scope.backUpList;
        ResetMessages($scope);
    };

    $scope.saveReorderModal = function () {
        SaveReorderModal($scope, $http, $location, AuthError, 'reorderDocuments');
    };

    $scope.changeFile = function (elm) {
        $scope.files = elm.files;
        $scope.$apply();
    };

    $scope.saveDocData = function () {
        $http.post("/api/admin/saveDocument.php", $scope.doc)
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        setTimeout($scope.getDocuments(), 1000);
                    });

                    $scope.isModalShown = !$scope.isModalShown;
                    $scope.submitted = false;
                    $scope.fileLoaded = false;
                })
                .error(function () {
                    $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                    $scope.isModalShown = !$scope.isModalShown;
                    $scope.submitted = false;
                    $scope.fileLoaded = false;
                });
    };

    $scope.saveDoc = function (form) {
        ResetMessages($scope);
        $scope.submitted = true;
        $scope.fileLoaded = $scope.files !== null;

        if (form.$valid && $scope.fileLoaded) {
            if ($scope.doc.id === 0) {
                var filePromise = FileService.saveFile($scope, "/api/admin/saveDocFile.php");
                filePromise.then(function (result) {
                    if (result.data !== null) {
                        ProcessSuccessResponse(result.data, $scope, $location, AuthError, function () {
                            $scope.doc.file = result.data.message.filePath;
                            $scope.fileSending = false;
                        });

                        if (result.data.error === 0) {
                            $scope.saveDocData();
                        } else {
                            $scope.isModalShown = !$scope.isModalShown;
                            $scope.fileSending = false;
                            $scope.submitted = false;
                            $scope.fileLoaded = false;
                        }
                    } else {
                        $scope.errMessage = "Súbor sa nepodarilo odoslať";
                        $scope.fileSending = false;
                        $scope.isModalShown = !$scope.isModalShown;
                        $scope.submitted = false;
                        $scope.fileLoaded = false;
                    }
                });
            } else {
                $scope.saveDocData();
            }
        }
    };

    $scope.getDocuments = function () {
        $http.post("/api/admin/getAllDocuments.php", {type: type})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.allDocuments = response.message;
                    });
                });
    };

    $scope.getDocument = function (docId) {
        $http.post("/api/admin/getDocument.php", {id: docId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.toggleModal();
                        $scope.doc = response.message;
                        $scope.modalTitle = modalEditTitle;
                        $scope.hideFileChooser = true;
                    });
                });
    };

    $scope.deleteDocument = function (docId) {
        ResetMessages($scope);

        $http.post("/api/admin/deleteDocument.php", {id: docId})
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                        setTimeout($scope.getDocuments(), 1000);
                    });
                });
    };

    $scope.getDocuments();

    $scope.submitted = false;
    $scope.isModalShown = false;
    $scope.doc = angular.copy(defaultValues);
});

appAdmin.controller('kontaktyCtrl', function ($scope, $http, $location, AuthError) {
    ResetMessages($scope);

    $scope.loadContacts = function () {
        $http.post("/api/admin/getContacts.php")
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.address = {
                            name: response.message.name,
                            street: response.message.street,
                            city: response.message.city
                        };
                        $('.summernote').code(response.message.content);
                    });
                });
    };

    $scope.saveContacts = function () {
        ResetMessages($scope);

        $http.post("/api/admin/saveContacts.php", {
            name: $scope.address.name,
            street: $scope.address.street,
            city: $scope.address.city,
            content: $('.summernote').code()
        })
                .success(function (response) {
                    ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                        $scope.infoMessage = response.message;
                    });
                })
                .error(function () {
                    $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                });
    };

    $scope.loadContacts();
});


function ResetMessages($scope) {
    $scope.infoMessage = "";
    $scope.errMessage = "";
}

function ProcessSuccessResponse(response, $scope, $location, AuthError, successExecute) {
    if (response.error === 0) {
        successExecute(response, $scope);
    } else if (response.error === 3) {
        $scope.errMessage = response.message;
    } else if (response.error === 2) {
        AuthError.error = response.message;
        $location.path('/');
    } else {
        $scope.errMessage = "<b>Neočakávaný error</b><br>" + response;
    }
}

function ToggleReorderModal($scope, list) {
    $scope.modalDialog = "/view/admin/modals/reorder.html";
    $scope.isModalShown = !$scope.isModalShown;
    $scope.backUpList = angular.copy(list);
    $scope.models = {
        selected: null,
        list: list
    };
    ResetMessages($scope);
}

function ReorderList(list) {
    for (var i = 0; i < list.length; i++) {
        list[i].order = i + 1;
    }
}

function SaveReorderModal($scope, $http, $location, AuthError, api) {
    ReorderList($scope.models.list);
    $http.post("/api/admin/" + api + ".php", $scope.models.list)
            .success(function (response) {
                ProcessSuccessResponse(response, $scope, $location, AuthError, function () {
                    $scope.infoMessage = response.message;
                });

                $scope.isModalShown = !$scope.isModalShown;
            })
            .error(function () {
                $scope.errMessage = "Zmeny sa nepodarilo uložiť.";
                $scope.isModalShown = !$scope.isModalShown;
            });
}
;

function GetLatestListOrder(list) {
    if (list.length > 0)
        return list[list.length - 1].order;
    else
        return 1;
}