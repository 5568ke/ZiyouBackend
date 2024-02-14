// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: recommendation.proto
// Protobuf C++ Version: 4.25.1

#ifndef GOOGLE_PROTOBUF_INCLUDED_recommendation_2eproto_2epb_2eh
#define GOOGLE_PROTOBUF_INCLUDED_recommendation_2eproto_2epb_2eh

#include <limits>
#include <string>
#include <type_traits>
#include <utility>

#include "google/protobuf/port_def.inc"
#if PROTOBUF_VERSION < 4025000
#error "This file was generated by a newer version of protoc which is"
#error "incompatible with your Protocol Buffer headers. Please update"
#error "your headers."
#endif  // PROTOBUF_VERSION

#if 4025001 < PROTOBUF_MIN_PROTOC_VERSION
#error "This file was generated by an older version of protoc which is"
#error "incompatible with your Protocol Buffer headers. Please"
#error "regenerate this file with a newer version of protoc."
#endif  // PROTOBUF_MIN_PROTOC_VERSION
#include "google/protobuf/port_undef.inc"
#include "google/protobuf/io/coded_stream.h"
#include "google/protobuf/arena.h"
#include "google/protobuf/arenastring.h"
#include "google/protobuf/generated_message_tctable_decl.h"
#include "google/protobuf/generated_message_util.h"
#include "google/protobuf/metadata_lite.h"
#include "google/protobuf/generated_message_reflection.h"
#include "google/protobuf/message.h"
#include "google/protobuf/repeated_field.h"  // IWYU pragma: export
#include "google/protobuf/extension_set.h"  // IWYU pragma: export
#include "google/protobuf/unknown_field_set.h"
// @@protoc_insertion_point(includes)

// Must be included last.
#include "google/protobuf/port_def.inc"

#define PROTOBUF_INTERNAL_EXPORT_recommendation_2eproto

namespace google {
namespace protobuf {
namespace internal {
class AnyMetadata;
}  // namespace internal
}  // namespace protobuf
}  // namespace google

// Internal implementation detail -- do not use these members.
struct TableStruct_recommendation_2eproto {
  static const ::uint32_t offsets[];
};
extern const ::google::protobuf::internal::DescriptorTable
    descriptor_table_recommendation_2eproto;
namespace recommendation {
class RecommendationRequest;
struct RecommendationRequestDefaultTypeInternal;
extern RecommendationRequestDefaultTypeInternal _RecommendationRequest_default_instance_;
class RecommendationResponse;
struct RecommendationResponseDefaultTypeInternal;
extern RecommendationResponseDefaultTypeInternal _RecommendationResponse_default_instance_;
}  // namespace recommendation
namespace google {
namespace protobuf {
}  // namespace protobuf
}  // namespace google

namespace recommendation {

// ===================================================================


// -------------------------------------------------------------------

class RecommendationResponse final :
    public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:recommendation.RecommendationResponse) */ {
 public:
  inline RecommendationResponse() : RecommendationResponse(nullptr) {}
  ~RecommendationResponse() override;
  template<typename = void>
  explicit PROTOBUF_CONSTEXPR RecommendationResponse(::google::protobuf::internal::ConstantInitialized);

  inline RecommendationResponse(const RecommendationResponse& from)
      : RecommendationResponse(nullptr, from) {}
  RecommendationResponse(RecommendationResponse&& from) noexcept
    : RecommendationResponse() {
    *this = ::std::move(from);
  }

  inline RecommendationResponse& operator=(const RecommendationResponse& from) {
    CopyFrom(from);
    return *this;
  }
  inline RecommendationResponse& operator=(RecommendationResponse&& from) noexcept {
    if (this == &from) return *this;
    if (GetArena() == from.GetArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance);
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields()
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.mutable_unknown_fields<::google::protobuf::UnknownFieldSet>();
  }

  static const ::google::protobuf::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::google::protobuf::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::google::protobuf::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const RecommendationResponse& default_instance() {
    return *internal_default_instance();
  }
  static inline const RecommendationResponse* internal_default_instance() {
    return reinterpret_cast<const RecommendationResponse*>(
               &_RecommendationResponse_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    1;

  friend void swap(RecommendationResponse& a, RecommendationResponse& b) {
    a.Swap(&b);
  }
  inline void Swap(RecommendationResponse* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() != nullptr &&
        GetArena() == other->GetArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() == other->GetArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(RecommendationResponse* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  RecommendationResponse* New(::google::protobuf::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<RecommendationResponse>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const RecommendationResponse& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom( const RecommendationResponse& from) {
    RecommendationResponse::MergeImpl(*this, from);
  }
  private:
  static void MergeImpl(::google::protobuf::Message& to_msg, const ::google::protobuf::Message& from_msg);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  ::size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::google::protobuf::internal::ParseContext* ctx) final;
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target, ::google::protobuf::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const { return _impl_._cached_size_.Get(); }

  private:
  ::google::protobuf::internal::CachedSize* AccessCachedSize() const final;
  void SharedCtor(::google::protobuf::Arena* arena);
  void SharedDtor();
  void InternalSwap(RecommendationResponse* other);

  private:
  friend class ::google::protobuf::internal::AnyMetadata;
  static ::absl::string_view FullMessageName() {
    return "recommendation.RecommendationResponse";
  }
  protected:
  explicit RecommendationResponse(::google::protobuf::Arena* arena);
  RecommendationResponse(::google::protobuf::Arena* arena, const RecommendationResponse& from);
  public:

  static const ClassData _class_data_;
  const ::google::protobuf::Message::ClassData*GetClassData() const final;

  ::google::protobuf::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kProblemIdsFieldNumber = 1,
  };
  // repeated int32 problemIds = 1;
  int problemids_size() const;
  private:
  int _internal_problemids_size() const;

  public:
  void clear_problemids() ;
  ::int32_t problemids(int index) const;
  void set_problemids(int index, ::int32_t value);
  void add_problemids(::int32_t value);
  const ::google::protobuf::RepeatedField<::int32_t>& problemids() const;
  ::google::protobuf::RepeatedField<::int32_t>* mutable_problemids();

  private:
  const ::google::protobuf::RepeatedField<::int32_t>& _internal_problemids() const;
  ::google::protobuf::RepeatedField<::int32_t>* _internal_mutable_problemids();

  public:
  // @@protoc_insertion_point(class_scope:recommendation.RecommendationResponse)
 private:
  class _Internal;

  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      0, 1, 0,
      0, 2>
      _table_;
  friend class ::google::protobuf::MessageLite;
  friend class ::google::protobuf::Arena;
  template <typename T>
  friend class ::google::protobuf::Arena::InternalHelper;
  using InternalArenaConstructable_ = void;
  using DestructorSkippable_ = void;
  struct Impl_ {

        inline explicit constexpr Impl_(
            ::google::protobuf::internal::ConstantInitialized) noexcept;
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena);
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena, const Impl_& from);
    ::google::protobuf::RepeatedField<::int32_t> problemids_;
    mutable ::google::protobuf::internal::CachedSize _problemids_cached_byte_size_;
    mutable ::google::protobuf::internal::CachedSize _cached_size_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_recommendation_2eproto;
};// -------------------------------------------------------------------

class RecommendationRequest final :
    public ::google::protobuf::Message /* @@protoc_insertion_point(class_definition:recommendation.RecommendationRequest) */ {
 public:
  inline RecommendationRequest() : RecommendationRequest(nullptr) {}
  ~RecommendationRequest() override;
  template<typename = void>
  explicit PROTOBUF_CONSTEXPR RecommendationRequest(::google::protobuf::internal::ConstantInitialized);

  inline RecommendationRequest(const RecommendationRequest& from)
      : RecommendationRequest(nullptr, from) {}
  RecommendationRequest(RecommendationRequest&& from) noexcept
    : RecommendationRequest() {
    *this = ::std::move(from);
  }

  inline RecommendationRequest& operator=(const RecommendationRequest& from) {
    CopyFrom(from);
    return *this;
  }
  inline RecommendationRequest& operator=(RecommendationRequest&& from) noexcept {
    if (this == &from) return *this;
    if (GetArena() == from.GetArena()
  #ifdef PROTOBUF_FORCE_COPY_IN_MOVE
        && GetArena() != nullptr
  #endif  // !PROTOBUF_FORCE_COPY_IN_MOVE
    ) {
      InternalSwap(&from);
    } else {
      CopyFrom(from);
    }
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.unknown_fields<::google::protobuf::UnknownFieldSet>(::google::protobuf::UnknownFieldSet::default_instance);
  }
  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields()
      ABSL_ATTRIBUTE_LIFETIME_BOUND {
    return _internal_metadata_.mutable_unknown_fields<::google::protobuf::UnknownFieldSet>();
  }

  static const ::google::protobuf::Descriptor* descriptor() {
    return GetDescriptor();
  }
  static const ::google::protobuf::Descriptor* GetDescriptor() {
    return default_instance().GetMetadata().descriptor;
  }
  static const ::google::protobuf::Reflection* GetReflection() {
    return default_instance().GetMetadata().reflection;
  }
  static const RecommendationRequest& default_instance() {
    return *internal_default_instance();
  }
  static inline const RecommendationRequest* internal_default_instance() {
    return reinterpret_cast<const RecommendationRequest*>(
               &_RecommendationRequest_default_instance_);
  }
  static constexpr int kIndexInFileMessages =
    0;

  friend void swap(RecommendationRequest& a, RecommendationRequest& b) {
    a.Swap(&b);
  }
  inline void Swap(RecommendationRequest* other) {
    if (other == this) return;
  #ifdef PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() != nullptr &&
        GetArena() == other->GetArena()) {
   #else  // PROTOBUF_FORCE_COPY_IN_SWAP
    if (GetArena() == other->GetArena()) {
  #endif  // !PROTOBUF_FORCE_COPY_IN_SWAP
      InternalSwap(other);
    } else {
      ::google::protobuf::internal::GenericSwap(this, other);
    }
  }
  void UnsafeArenaSwap(RecommendationRequest* other) {
    if (other == this) return;
    ABSL_DCHECK(GetArena() == other->GetArena());
    InternalSwap(other);
  }

  // implements Message ----------------------------------------------

  RecommendationRequest* New(::google::protobuf::Arena* arena = nullptr) const final {
    return CreateMaybeMessage<RecommendationRequest>(arena);
  }
  using ::google::protobuf::Message::CopyFrom;
  void CopyFrom(const RecommendationRequest& from);
  using ::google::protobuf::Message::MergeFrom;
  void MergeFrom( const RecommendationRequest& from) {
    RecommendationRequest::MergeImpl(*this, from);
  }
  private:
  static void MergeImpl(::google::protobuf::Message& to_msg, const ::google::protobuf::Message& from_msg);
  public:
  PROTOBUF_ATTRIBUTE_REINITIALIZES void Clear() final;
  bool IsInitialized() const final;

  ::size_t ByteSizeLong() const final;
  const char* _InternalParse(const char* ptr, ::google::protobuf::internal::ParseContext* ctx) final;
  ::uint8_t* _InternalSerialize(
      ::uint8_t* target, ::google::protobuf::io::EpsCopyOutputStream* stream) const final;
  int GetCachedSize() const { return _impl_._cached_size_.Get(); }

  private:
  ::google::protobuf::internal::CachedSize* AccessCachedSize() const final;
  void SharedCtor(::google::protobuf::Arena* arena);
  void SharedDtor();
  void InternalSwap(RecommendationRequest* other);

  private:
  friend class ::google::protobuf::internal::AnyMetadata;
  static ::absl::string_view FullMessageName() {
    return "recommendation.RecommendationRequest";
  }
  protected:
  explicit RecommendationRequest(::google::protobuf::Arena* arena);
  RecommendationRequest(::google::protobuf::Arena* arena, const RecommendationRequest& from);
  public:

  static const ClassData _class_data_;
  const ::google::protobuf::Message::ClassData*GetClassData() const final;

  ::google::protobuf::Metadata GetMetadata() const final;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  enum : int {
    kChaptersFieldNumber = 3,
    kDifficultiesFieldNumber = 4,
    kVersionFieldNumber = 1,
    kGradeFieldNumber = 2,
    kNumProblemsFieldNumber = 5,
  };
  // repeated int32 chapters = 3;
  int chapters_size() const;
  private:
  int _internal_chapters_size() const;

  public:
  void clear_chapters() ;
  ::int32_t chapters(int index) const;
  void set_chapters(int index, ::int32_t value);
  void add_chapters(::int32_t value);
  const ::google::protobuf::RepeatedField<::int32_t>& chapters() const;
  ::google::protobuf::RepeatedField<::int32_t>* mutable_chapters();

  private:
  const ::google::protobuf::RepeatedField<::int32_t>& _internal_chapters() const;
  ::google::protobuf::RepeatedField<::int32_t>* _internal_mutable_chapters();

  public:
  // repeated int32 difficulties = 4;
  int difficulties_size() const;
  private:
  int _internal_difficulties_size() const;

  public:
  void clear_difficulties() ;
  ::int32_t difficulties(int index) const;
  void set_difficulties(int index, ::int32_t value);
  void add_difficulties(::int32_t value);
  const ::google::protobuf::RepeatedField<::int32_t>& difficulties() const;
  ::google::protobuf::RepeatedField<::int32_t>* mutable_difficulties();

  private:
  const ::google::protobuf::RepeatedField<::int32_t>& _internal_difficulties() const;
  ::google::protobuf::RepeatedField<::int32_t>* _internal_mutable_difficulties();

  public:
  // int32 version = 1;
  void clear_version() ;
  ::int32_t version() const;
  void set_version(::int32_t value);

  private:
  ::int32_t _internal_version() const;
  void _internal_set_version(::int32_t value);

  public:
  // int32 grade = 2;
  void clear_grade() ;
  ::int32_t grade() const;
  void set_grade(::int32_t value);

  private:
  ::int32_t _internal_grade() const;
  void _internal_set_grade(::int32_t value);

  public:
  // int32 numProblems = 5;
  void clear_numproblems() ;
  ::int32_t numproblems() const;
  void set_numproblems(::int32_t value);

  private:
  ::int32_t _internal_numproblems() const;
  void _internal_set_numproblems(::int32_t value);

  public:
  // @@protoc_insertion_point(class_scope:recommendation.RecommendationRequest)
 private:
  class _Internal;

  friend class ::google::protobuf::internal::TcParser;
  static const ::google::protobuf::internal::TcParseTable<
      3, 5, 0,
      0, 2>
      _table_;
  friend class ::google::protobuf::MessageLite;
  friend class ::google::protobuf::Arena;
  template <typename T>
  friend class ::google::protobuf::Arena::InternalHelper;
  using InternalArenaConstructable_ = void;
  using DestructorSkippable_ = void;
  struct Impl_ {

        inline explicit constexpr Impl_(
            ::google::protobuf::internal::ConstantInitialized) noexcept;
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena);
        inline explicit Impl_(::google::protobuf::internal::InternalVisibility visibility,
                              ::google::protobuf::Arena* arena, const Impl_& from);
    ::google::protobuf::RepeatedField<::int32_t> chapters_;
    mutable ::google::protobuf::internal::CachedSize _chapters_cached_byte_size_;
    ::google::protobuf::RepeatedField<::int32_t> difficulties_;
    mutable ::google::protobuf::internal::CachedSize _difficulties_cached_byte_size_;
    ::int32_t version_;
    ::int32_t grade_;
    ::int32_t numproblems_;
    mutable ::google::protobuf::internal::CachedSize _cached_size_;
    PROTOBUF_TSAN_DECLARE_MEMBER
  };
  union { Impl_ _impl_; };
  friend struct ::TableStruct_recommendation_2eproto;
};

// ===================================================================




// ===================================================================


#ifdef __GNUC__
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#endif  // __GNUC__
// -------------------------------------------------------------------

// RecommendationRequest

// int32 version = 1;
inline void RecommendationRequest::clear_version() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.version_ = 0;
}
inline ::int32_t RecommendationRequest::version() const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationRequest.version)
  return _internal_version();
}
inline void RecommendationRequest::set_version(::int32_t value) {
  _internal_set_version(value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationRequest.version)
}
inline ::int32_t RecommendationRequest::_internal_version() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.version_;
}
inline void RecommendationRequest::_internal_set_version(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.version_ = value;
}

// int32 grade = 2;
inline void RecommendationRequest::clear_grade() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.grade_ = 0;
}
inline ::int32_t RecommendationRequest::grade() const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationRequest.grade)
  return _internal_grade();
}
inline void RecommendationRequest::set_grade(::int32_t value) {
  _internal_set_grade(value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationRequest.grade)
}
inline ::int32_t RecommendationRequest::_internal_grade() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.grade_;
}
inline void RecommendationRequest::_internal_set_grade(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.grade_ = value;
}

// repeated int32 chapters = 3;
inline int RecommendationRequest::_internal_chapters_size() const {
  return _internal_chapters().size();
}
inline int RecommendationRequest::chapters_size() const {
  return _internal_chapters_size();
}
inline void RecommendationRequest::clear_chapters() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.chapters_.Clear();
}
inline ::int32_t RecommendationRequest::chapters(int index) const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationRequest.chapters)
  return _internal_chapters().Get(index);
}
inline void RecommendationRequest::set_chapters(int index, ::int32_t value) {
  _internal_mutable_chapters()->Set(index, value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationRequest.chapters)
}
inline void RecommendationRequest::add_chapters(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _internal_mutable_chapters()->Add(value);
  // @@protoc_insertion_point(field_add:recommendation.RecommendationRequest.chapters)
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationRequest::chapters() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_list:recommendation.RecommendationRequest.chapters)
  return _internal_chapters();
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationRequest::mutable_chapters()
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_mutable_list:recommendation.RecommendationRequest.chapters)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  return _internal_mutable_chapters();
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationRequest::_internal_chapters()
    const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.chapters_;
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationRequest::_internal_mutable_chapters() {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return &_impl_.chapters_;
}

// repeated int32 difficulties = 4;
inline int RecommendationRequest::_internal_difficulties_size() const {
  return _internal_difficulties().size();
}
inline int RecommendationRequest::difficulties_size() const {
  return _internal_difficulties_size();
}
inline void RecommendationRequest::clear_difficulties() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.difficulties_.Clear();
}
inline ::int32_t RecommendationRequest::difficulties(int index) const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationRequest.difficulties)
  return _internal_difficulties().Get(index);
}
inline void RecommendationRequest::set_difficulties(int index, ::int32_t value) {
  _internal_mutable_difficulties()->Set(index, value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationRequest.difficulties)
}
inline void RecommendationRequest::add_difficulties(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _internal_mutable_difficulties()->Add(value);
  // @@protoc_insertion_point(field_add:recommendation.RecommendationRequest.difficulties)
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationRequest::difficulties() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_list:recommendation.RecommendationRequest.difficulties)
  return _internal_difficulties();
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationRequest::mutable_difficulties()
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_mutable_list:recommendation.RecommendationRequest.difficulties)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  return _internal_mutable_difficulties();
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationRequest::_internal_difficulties()
    const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.difficulties_;
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationRequest::_internal_mutable_difficulties() {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return &_impl_.difficulties_;
}

// int32 numProblems = 5;
inline void RecommendationRequest::clear_numproblems() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.numproblems_ = 0;
}
inline ::int32_t RecommendationRequest::numproblems() const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationRequest.numProblems)
  return _internal_numproblems();
}
inline void RecommendationRequest::set_numproblems(::int32_t value) {
  _internal_set_numproblems(value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationRequest.numProblems)
}
inline ::int32_t RecommendationRequest::_internal_numproblems() const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.numproblems_;
}
inline void RecommendationRequest::_internal_set_numproblems(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  ;
  _impl_.numproblems_ = value;
}

// -------------------------------------------------------------------

// RecommendationResponse

// repeated int32 problemIds = 1;
inline int RecommendationResponse::_internal_problemids_size() const {
  return _internal_problemids().size();
}
inline int RecommendationResponse::problemids_size() const {
  return _internal_problemids_size();
}
inline void RecommendationResponse::clear_problemids() {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _impl_.problemids_.Clear();
}
inline ::int32_t RecommendationResponse::problemids(int index) const {
  // @@protoc_insertion_point(field_get:recommendation.RecommendationResponse.problemIds)
  return _internal_problemids().Get(index);
}
inline void RecommendationResponse::set_problemids(int index, ::int32_t value) {
  _internal_mutable_problemids()->Set(index, value);
  // @@protoc_insertion_point(field_set:recommendation.RecommendationResponse.problemIds)
}
inline void RecommendationResponse::add_problemids(::int32_t value) {
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  _internal_mutable_problemids()->Add(value);
  // @@protoc_insertion_point(field_add:recommendation.RecommendationResponse.problemIds)
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationResponse::problemids() const
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_list:recommendation.RecommendationResponse.problemIds)
  return _internal_problemids();
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationResponse::mutable_problemids()
    ABSL_ATTRIBUTE_LIFETIME_BOUND {
  // @@protoc_insertion_point(field_mutable_list:recommendation.RecommendationResponse.problemIds)
  PROTOBUF_TSAN_WRITE(&_impl_._tsan_detect_race);
  return _internal_mutable_problemids();
}
inline const ::google::protobuf::RepeatedField<::int32_t>& RecommendationResponse::_internal_problemids()
    const {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return _impl_.problemids_;
}
inline ::google::protobuf::RepeatedField<::int32_t>* RecommendationResponse::_internal_mutable_problemids() {
  PROTOBUF_TSAN_READ(&_impl_._tsan_detect_race);
  return &_impl_.problemids_;
}

#ifdef __GNUC__
#pragma GCC diagnostic pop
#endif  // __GNUC__

// @@protoc_insertion_point(namespace_scope)
}  // namespace recommendation


// @@protoc_insertion_point(global_scope)

#include "google/protobuf/port_undef.inc"

#endif  // GOOGLE_PROTOBUF_INCLUDED_recommendation_2eproto_2epb_2eh
